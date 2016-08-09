From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 09 Aug 2016 12:03:35 +0000
Subject: Re: [PATCH] rtc: pcf2123: Add missing error code assignment before test
Message-Id: <alpine.DEB.2.10.1608091403050.2911@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1817157135-1470744216=:2911"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470743907-11498-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470743907-11498-1-git-send-email-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: a.zummo@towertech.it, alexandre.belloni@free-electrons.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1817157135-1470744216=:2911
Content-Type: TEXT/PLAIN; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 9 Aug 2016, Christophe JAILLET wrote:

> It is likely that checking the result of 'pcf2123_write_reg' is expected
> here.
> Also fix a small style issue. The '{' at the beginning of the function
> is misplaced.

They shouldn't be in the same patch.  If you are wrong about the ret
issue, the { should still be moved.

julia

>
> Fixes: 809b453b76e15 ("rtc: pcf2123: clean up writes to the rtc chip")
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/rtc/rtc-pcf2123.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
> index b4478cc92b55..8895f77726e8 100644
> --- a/drivers/rtc/rtc-pcf2123.c
> +++ b/drivers/rtc/rtc-pcf2123.c
> @@ -182,7 +182,8 @@ static ssize_t pcf2123_show(struct device *dev, struct device_attribute *attr,
>  }
>
>  static ssize_t pcf2123_store(struct device *dev, struct device_attribute *attr,
> -			     const char *buffer, size_t count) {
> +			     const char *buffer, size_t count)
> +{
>  	struct pcf2123_sysfs_reg *r;
>  	unsigned long reg;
>  	unsigned long val;
> @@ -199,7 +200,7 @@ static ssize_t pcf2123_store(struct device *dev, struct device_attribute *attr,
>  	if (ret)
>  		return ret;
>
> -	pcf2123_write_reg(dev, reg, val);
> +	ret = pcf2123_write_reg(dev, reg, val);
>  	if (ret < 0)
>  		return -EIO;
>  	return count;
> --
> 2.7.4
>
>
> ---
> L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
> https://www.avast.com/antivirus
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--8323329-1817157135-1470744216=:2911--
