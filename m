From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 15 Apr 2004 23:09:24 +0000
Subject: Re: [Kernel-janitors] [PATCH] - Replaces yield() with
Message-Id: <20040415160924.2f96abe8.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58998938665127709=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <407C9AEE.5020808@legolas.alternex.com.br>
In-Reply-To: <407C9AEE.5020808@legolas.alternex.com.br>
To: kernel-janitors@vger.kernel.org

--===============58998938665127709==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Apr 2004 22:59:10 -0300 Gustavo Franco wrote:

| Hi,
| 
| I'm new here, and this is my first patch, following the issue described by
| Matthew Wilcox: "Calling yield() Considered Harmful" on TODO list.
| 
| There is no doubt that isn't necessary replace all yield() calls, but i'm
| planning to check each case on the tree.Comments?
| 
| Hope that helps,
| Gustavo Franco
| p.s: This e-mail on the "from" is only for ML traffic, my main e-mail is
| stratus at acm.dot org.
| 
| 
| --- drivers/cdrom/cdu31a.c.orig 2004-04-13 22:43:55.000000000 -0300
| +++ drivers/cdrom/cdu31a.c      2004-04-13 22:44:17.000000000 -0300
| @@ -386,7 +386,7 @@ static inline void sony_sleep(void)
|         unsigned long flags;
|                                                                                          
| 
|         if (cdu31a_irq <= 0) {
| -               yield();
| +               schedule_timeout(1);
|         } else {                /* Interrupt driven */
| 
|                 save_flags(flags);

Makes sense, except that the comment above the function bothers me:

/*
 * Wait a little while (used for polling the drive).  If in initialization,
 * setting a timeout doesn't work, so just loop for a while.
 */

I expect that cdu31a_irq <= 0 means "in initializatgion," so is
using schedule_timeout() safe here?  anyone checked this?

--
~Randy

--===============58998938665127709==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58998938665127709==--
