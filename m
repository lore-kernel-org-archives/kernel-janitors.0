From: "Petr Vandrovec" <VANDROVE@vc.cvut.cz>
Date: Tue, 27 Jul 2004 11:38:05 +0000
Subject: [Kernel-janitors] Re: [PATCH] radio/radio-sf16fmi: replace
Message-Id: <D4E77F3350F@vcnet.vc.cvut.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94957723906922764=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41058881.1080406@zabbo.net>
In-Reply-To: <41058881.1080406@zabbo.net>
To: kernel-janitors@vger.kernel.org

--===============94957723906922764==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT

On 26 Jul 04 at 15:41, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list.
> 
> Description: Replaced schedule_timeout() with msleep() to guarantee the
> task delays the desired time.

I do not agree. Delay is here just to make sure that we do not talk
to chip too quickly after sending previous command (it is important
especially for get signal strength; I think that it is not needed
at all in set frequency), and as such it does not matter whether we 
wait 100ms, 143ms, or one second. I find busy loop with mdelay 
unacceptable.

If your architecture has HZ less than 7, then just replace HZ/7 with
HZ/7 + 1...
                                    Best regards,   
                                            Petr Vandrovec
                                            
 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/media/radio/radio-sf16fmi.c   2004-06-16 05:20:03.000000000 +0000
> +++ linux-dev/drivers/media/radio/radio-sf16fmi.c   2004-07-02 20:46:57.000000000 +0000
> @@ -89,8 +89,7 @@ static inline int fmi_setfreq(struct fmi
>  
>     outbits(16, RSF16_ENCODE(freq), myport);
>     outbits(8, 0xC0, myport);
> -   current->state = TASK_UNINTERRUPTIBLE;
> -   schedule_timeout(HZ/7);
> +   msleep(143);        /* was schedule_timeout(HZ/7) */
>     up(&lock);
>     if (dev->curvol) fmi_unmute(myport);
>     return 0;
> @@ -107,8 +106,7 @@ static inline int fmi_getsigstr(struct f
>     val = dev->curvol ? 0x08 : 0x00;    /* unmute/mute */
>     outb(val, myport);
>     outb(val | 0x10, myport);
> -   set_current_state(TASK_UNINTERRUPTIBLE);
> -   schedule_timeout(HZ/7);
> +   msleep(143);        /* was schedule_timeout(HZ/7) */
>     res = (int)inb(myport+1);
>     outb(val, myport);


--===============94957723906922764==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94957723906922764==--
