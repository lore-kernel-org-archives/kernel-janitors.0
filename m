From: Sony Chacko <sony.chacko@qlogic.com>
Date: Thu, 30 Jan 2014 20:47:25 +0000
Subject: RE: qlcnic: flash template based firmware reset recovery
Message-Id: <0EA5B226BC5C7B45A71BF612AA8A019E89ACB36B@AVMB1.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140130114628.GA12734@elgon.mountain>
In-Reply-To: <20140130114628.GA12734@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Thursday, January 30, 2014 3:46 AM
> To: Sony Chacko
> Cc: kernel-janitors@vger.kernel.org
> Subject: re: qlcnic: flash template based firmware reset recovery
> 
> Hello Sony Chacko,
> 
> The patch 81d0aeb0a4ff: "qlcnic: flash template based firmware reset
> recovery" from Jan 1, 2013, leads to the following static checker
> warning:
> 
> 	drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c:1756
> 		qlcnic_83xx_poll_list()
> 	warn: we tested 'delay' before and it was 'true'
> 
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
>   1745          delay = (long)p_hdr->delay;
>   1746
>   1747          if (!delay) {
>                     ^^^^^^
> 
>   1748                  for (i = 0; i < p_hdr->count; i++, entry++)
>   1749                          qlcnic_83xx_poll_reg(p_dev, entry->arg1,
>   1750                                               delay, poll->mask,
>   1751                                               poll->status);
>   1752          } else {
>   1753                  for (i = 0; i < p_hdr->count; i++, entry++) {
>   1754                          arg1 = entry->arg1;
>   1755                          arg2 = entry->arg2;
>   1756                          if (delay) {
>                                     ^^^^^ "delay" is non-zero here.  No need to check again.
> 
>   1757                                  if (qlcnic_83xx_poll_reg(p_dev,
>   1758                                                           arg1, delay,
>   1759                                                           poll->mask,
>   1760                                                           poll->status)){
>   1761                                          QLCRD32(p_dev, arg1, &err);
>   1762                                          if (err = -EIO)
>   1763                                                  return;
>   1764                                          QLCRD32(p_dev, arg2, &err);
>   1765                                          if (err = -EIO)
>   1766                                                  return;
> 
> But my main reason for emailing is that I'm confused by the error handling
> here.  qlcnic_83xx_poll_reg() returns zero on success or positive timeout or a
> negative error code.  How does calling
> QLCRD32() fix the error?

Dan,

Thanks, We will fix these issues in the upcoming patches.

Regards,
Sony
