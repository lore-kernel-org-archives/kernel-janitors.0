From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 29 Apr 2005 22:12:46 +0000
Subject: Re: [KJ] =?iso-8859-1?Q?sti()/cli()-removal,
Message-Id: <20050429151246.7094ea3f.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============055614830287624706=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <IFPB6Z$747834397F9D81C85F5AEAA672AA0180@tiscali.fr>
In-Reply-To: <IFPB6Z$747834397F9D81C85F5AEAA672AA0180@tiscali.fr>
To: kernel-janitors@vger.kernel.org

--===============055614830287624706==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 Apr 2005 23:47:26 +0200 Domen Puncer wrote:

| >  static void ep7211_ir_open(dongle_t *self, struct qos_info
| > *qos)
| >  {
| >  	unsigned int syscon1, flags;
| > -
| > -	save_flags(flags); cli();
| > +	spin_lock_init(&driver_lock);
| > +
| > +	spin_lock_irqsave(&driver_lock,flags);
| 
| This doesn't look safe. Imagine 2 processes on SMP. (After some
| browsing, this looks like some ARM architecture, so probably no
| SMP; still better put this in ep7211_ir_init() or declare with
| static DEFINE_SPINLOCK.)

Work on ARM SMP is happening though.... so be aware of it,
don't think that an ARM driver can ignore SMP (any longer).

---
~Randy

--===============055614830287624706==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============055614830287624706==--
