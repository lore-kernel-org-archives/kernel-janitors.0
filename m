From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jun 2020 12:14:38 +0000
Subject: Re: [PATCH] gpio: arizona: put pm_runtime in case of failure
Message-Id: <11488e76-2ea0-6478-0800-deb0438f0136@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

I recommend to replace the word “pm_runtime” by the
alternative “PM run time system” in the patch subject.


> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count if pm_runtime_put is not called in
> error handling paths.

Should the term “reference count” be used here?


> Call pm_runtime_put if pm_runtime_get_sync fails.

The diff hunks show an other function name.


…
> +++ b/drivers/gpio/gpio-arizona.c
> @@ -64,6 +64,7 @@  static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
>  		ret = pm_runtime_get_sync(chip->parent);
>  		if (ret < 0) {
>  			dev_err(chip->parent, "Failed to resume: %d\n", ret);
> +			pm_runtime_put_autosuspend(chip->parent);
>  			return ret;
>  		}

You propose to use identical statements in three if branches.
Please add a corresponding jump target for better exception handling.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=435faf5c218a47fd6258187f62d9bb1009717896#n455


Would you like to add the tag “Fixes” to the commit message?


I find it amazing how many questionable implementation details
you pointed out recently.
Were these contributions triggered by an evolving source code analysis
tool like CheQ?
https://github.com/umnsec/cheq/

Regards,
Markus
