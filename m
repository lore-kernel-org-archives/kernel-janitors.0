From: Domen Puncer <domen@coderock.org>
Date: Mon, 24 May 2004 13:24:40 +0000
Subject: [Kernel-janitors] Re: Replaces yield() with nicedelay() on
Message-Id: <20040524132440.GA23599@nd47>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31949200530492616=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31949200530492616==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 02/05/04 22:24 -0300, Gustavo Franco wrote:
> Hi,
> 
> It's the last REDIFF, but i'm not replacing yield() with 
> schedule_timeout() because there's a nicedelay() (maybe the
> usecs need to be tuned below) there:
> 
> 
> static inline void nicedelay(unsigned long usecs)
> {
>         current->state = TASK_INTERRUPTIBLE;
>         schedule_timeout(HZ);
>         return;
> }

And usecs stands for??
Funny thing is that there are actualy uses of this function.

Also, please make -p1 applyable patches.

> 
> Hope that helps,
> Gustavo Franco
> 
> --- drivers/net/sb1000.c.orig   2004-04-28 20:50:17.000000000 -0300
> +++ drivers/net/sb1000.c        2004-04-28 20:49:10.000000000 -0300
> @@ -271,7 +271,7 @@
>         timeout = jiffies + TimeOutJiffies;
>         while (a & 0x80 || a & 0x40) {
>                 /* a little sleep */
> -               yield();
> +               nicedelay(10000);
> 
> 
>                 a = inb(ioaddr[0] + 7);
>                 if (time_after_eq(jiffies, timeout)) {
> @@ -295,7 +295,7 @@
>         timeout = jiffies + TimeOutJiffies;
>         while (a & 0x80 || !(a & 0x40)) {
>                 /* a little sleep */
> -               yield();
> +               nicedelay(10000);
> 
> 
>                 a = inb(ioaddr[1] + 6);
>                 if (time_after_eq(jiffies, timeout)) {
> 
> 
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============31949200530492616==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31949200530492616==--
