import time

from selenium import webdriver
from selenium.common.exceptions import (
    NoSuchElementException, NoSuchFrameException, NoSuchWindowException, TimeoutException, WebDriverException
)


def am_auto(uid=None, duration=None):
    uid = uid or 1
    duration = duration or 5 * 60
    check_num = 0
    url = 'https://www.alexamaster.net/Master/' + str(uid)

    browser = webdriver.Firefox(
        firefox_profile=None,
        firefox_binary=None,
        timeout=30,
        capabilities=None,
        proxy=None,
        executable_path="geckodriver",
        firefox_options=None,
        log_path="geckodriver2.log"
    )
    browser.get(url)
    handle = browser.current_window_handle
    handles = browser.window_handles

    while True:
        try:
            current_url = browser.current_url
        except WebDriverException:
            browser = webdriver.Firefox(
                firefox_profile=None,
                firefox_binary=None,
                timeout=30,
                capabilities=None,
                proxy=None,
                executable_path="geckodriver",
                firefox_options=None,
                log_path="geckodriver2.log"
            )
            browser.get(url)
            handle = browser.current_window_handle
            handles = browser.window_handles
            current_url = browser.current_url

        if current_url.startswith(url):
            if check_num >= 6:
                new_handles = browser.window_handles
                new_open_handles = [h for h in new_handles if h not in handles]
                for h in new_open_handles:
                    browser.switch_to_window(h)
                    browser.close()
                browser.switch_to_window(handle)
                browser.get(url)
                check_num = 0
            else:
                try:
                    browser.find_element_by_xpath('//swal2-image[@src="img/unblock.png"]')
                    browser.get(url)
                    check_num = 0
                except NoSuchElementException:
                    check_num += 1
        else:
            new_handles = browser.window_handles
            new_open_handles = [h for h in new_handles if h not in handles]
            for h in new_open_handles:
                browser.switch_to_window(h)
                browser.close()
            browser.switch_to_window(handle)
            browser.get(url)
            check_num = 0

        time.sleep(duration)


if __name__ == '__main__':
    am_auto()
