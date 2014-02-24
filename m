From: Silvan Jegen <s.jegen@gmail.com>
Date: Mon, 24 Feb 2014 21:36:34 +0000
Subject: Re: [PATCH] Replace min macro with min_t
Message-Id: <20140224213634.GA22032@myarchbang>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530bb134.84ce0e0a.2d96.2b6b@mx.google.com>
In-Reply-To: <530bb134.84ce0e0a.2d96.2b6b@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 25, 2014 at 12:11:51AM +0300, Dan Carpenter wrote:
> It's sort of a lot of work to review all 79 changes...  Your patch is
> correct, but I think you are going to get mixed reactions from
> maintainers.  A lot of them don't like to review cleanups like this.

I see...


> I guess my advice would be to split it up and send it to the friendliest
> maintainers first and see how they respond then slowly feed it to the
> other maintainers.  When you get to the unfriendliest maintainers you
> can handle then stop.  :P

I assume you don't have a private MAINTAINERS list ordered by friendliness
handy, or do you? :P

So the best way to proceed would be to split the patch up by subsystem and
send the splitted parts to the appropriate subsystem maintainers.


> Staging is the friendliest subsystem, but none of these patches touch
> staging.  Maybe wireless and usb.

Actually, there is one:

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 6202358..498995d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -609,7 +609,7 @@ static int r8192_wx_set_nick(struct net_device *dev,
    if (wrqu->data.length > IW_ESSID_MAX_SIZE)
        return -E2BIG;
    down(&priv->wx_sem);
-   wrqu->data.length = min((size_t) wrqu->data.length, sizeof(priv->nick));
+   wrqu->data.length = min_t(size_t, wrqu->data.length, sizeof(priv->nick));
    memset(priv->nick, 0, sizeof(priv->nick));
    memcpy(priv->nick, extra, wrqu->data.length);
    up(&priv->wx_sem);

I think I will split the patch in three parts (staging, wireless and usb),
send them to the different maintainers and then brace myself for their
reactions (I think I will CC the janitor list for their reading pleasure).

Thanks for the review and the advice.


Cheers,

Silvan

