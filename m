From: randy_dunlap <rdunlap@xenotime.net>
Date: Fri, 08 Jul 2005 18:21:48 +0000
Subject: Re: [KJ] Re: GCC4 warning: no return statement in function
Message-Id: <20050708112148.49cf1a86.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74037428305222663=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050701221504.GA26388@homer.coderock.org>
In-Reply-To: <20050701221504.GA26388@homer.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============74037428305222663==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 07 Jul 2005 14:14:13 -0700 Jesse Millan wrote:

| randy_dunlap wrote:
| > On Sat, 2 Jul 2005 00:22:51 +0200 Domen Puncer wrote:
| > 
| > | On 02/07/05 00:15 +0200, Domen Puncer wrote:
| > | > On 01/07/05 11:19 -0700, Jesse Millan wrote:
| > | > > -int kauditd_thread(void *dummy)
| > | > > +void kauditd_thread(void *dummy)
| > | > 
| > | > This should warn too, as kthread_create() (kthread_run()) accepts
| > | > int (*threadfn)(void *data)
| > | > 
| > | > I think kauditd_thread() should be fixed here to return something...
| > | > "The return value should be zero or a negative error number:
| > | >  it will be passed to kthread_stop()."
| > | 
| > | But it doesn't return at all (d'oh, should have seen this before).
| > | Still... there's a warning if it returns void, right?
| > 
| > so it needs 
| >   __attribute__((noreturn))
| > added to the function?
| > (or ATTRIB_NORET)
| > 
| > ---
| > ~Randy
| > 
| 
| Using the noreturn attribute implies to me that the return type should
| be void. That can't be because kthread_run() expects a pointer to a
| function that returns an int. Any return statement after the while(1) is
| unreacable as Domen pointed out...
| 
| Could you clarify what needs to be done?

Not really.  and your summary above is correct, including that the
return type for noreturn should be void.  (see GCC 4.0.1 manual:

http://gcc.gnu.org/onlinedocs/gcc-4.0.1/gcc/Function-Attributes.html#Function-Attributes

"It does not make sense for a noreturn function to have a return type other than void."

I suppose you could try asking on the
gcc-help@gcc.gnu.org  mailing list.

---
~Randy

--===============74037428305222663==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74037428305222663==--
