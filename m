From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 14 Aug 2004 19:09:30 +0000
Subject: Re: [Kernel-janitors] [PATCH] net/xirc2ps_cs: replace
Message-Id: <20040814190930.GL1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61418113169247057=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727183752.GS2099@us.ibm.com>
In-Reply-To: <20040727183752.GS2099@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============61418113169247057==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 27 Jul 2004, Nishanth Aravamudan wrote:

> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Replace Wait() with msleep() to guarantee the
> task delays for the desired time. Remove the definition of Wait().
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/net/pcmcia/xirc2ps_cs.c	2004-06-15 22:19:13.000000000 -0700
> +++ linux-dev/drivers/net/pcmcia/xirc2ps_cs.c	2004-07-27 11:33:27.000000000 -0700
> @@ -418,11 +418,6 @@ next_tuple(client_handle_t handle, tuple
>  #define PutByte(reg,value) outb((value), ioaddr+(reg))
>  #define PutWord(reg,value) outw((value), ioaddr+(reg))
>  
> -#define Wait(n) do { \
> -	set_current_state(TASK_UNINTERRUPTIBLE); \
> -	schedule_timeout(n); \
> -} while (0)
> -
>  /*====== Functions used for debugging =================================*/
>  #if defined(PCMCIA_DEBUG) && 0 /* reading regs may change system status */
>  static void
> @@ -1716,13 +1711,13 @@ hardreset(struct net_device *dev)
>  
>      SelectPage(4);
>      udelay(1);
> -    Wait(HZ/25);		     /* wait 40 msec */
> +    msleep(40);				/* wait 40msec */
>      if (local->mohawk)
>  	PutByte(XIRCREG4_GPR1, 1);	 /* set bit 0: power up */
>      else
>  	PutByte(XIRCREG4_GPR1, 1 | 4);	 /* set bit 0: power up, bit 2: AIC */
> -    Wait(HZ/50);		     /* wait 20 msec */
> +    msleep(20);				/* wait 20msec */
>  }
>  
>  static void
> @@ -1736,9 +1731,9 @@ do_reset(struct net_device *dev, int ful

patching file drivers/net/pcmcia/xirc2ps_cs.c
patch: **** malformed patch at line 126: @@ -1736,9 +1731,9 @@ do_reset(struct net_device *dev, int ful

please do resend this one.
thanks maks


--===============61418113169247057==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61418113169247057==--
