From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 11 Nov 2010 09:04:23 +0000
Subject: Re: [patch] input: pcf8574_keypad: use after
Message-Id: <20101111090423.GH24415@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101111062429.GA3610@bicker>
In-Reply-To: <20101111062429.GA3610@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Jean Delvare <khali@linux-fr.org>, Mike Frysinger <vapier@gentoo.org>, Richard Purdie <rpurdie@linux.intel.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 11, 2010 at 10:28:30AM +0300, Dan Carpenter wrote:
> input_unregister_device() is tricky because it frees the argument.  So
> in the original code the call to input_set_drvdata(idev, NULL) is a use
> after free bug.  The other problem is the input_set_drvdata() makes the 
> input_free_device() into a no-op.
> 
> The prefered style in input/ is to make input_register_device() the
> last function in the probe which can fail.  That way we don't need to
> call input_unregister_device().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.

-- 
Dmitry
