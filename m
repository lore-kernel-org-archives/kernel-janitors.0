From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 14 Jun 2004 16:05:13 +0000
Subject: Re: [Kernel-janitors] panic todo?
Message-Id: <20040614090513.4179f62e.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47934184167781213=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406111926.i5BJQV3E015754@sirius.cs.pdx.edu>
In-Reply-To: <200406111926.i5BJQV3E015754@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============47934184167781213==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Jun 2004 09:00:24 -0700 (PDT) Kristen Carlson wrote:

| > 
| > On Sat, 12 Jun 2004, Randy.Dunlap wrote:
| > 
| > > On Sat, 12 Jun 2004 11:53:36 +0200 (Walter Harms) wrote:
| > > 
| > > | 
| > > | hi,
| > > | just for my understanding. i would exspect a halt on panic()
| > > | while a machine_reboot() is a reboot !?
| > > 
| > > RTSL.  or read Documentation/kernel-parameters.txt:
| > 
| > an interesting article on the topic from Jonathan Corbet:
| > http://lwn.net/Articles/87684/
| > features a disk dump patch.
| > 
| > a++ maks
| > 
| Having thought about it a little more, I now question why this is on 
| the todo list at all.  It doesn't make sense to just replace panic() 
| with machine_restart().  It does make sense to audit the use of panic
| in device drivers to make sure that panic isn't being used as a lazy
| way of not dealing with error conditions, but even then I wouldn't
| think you would want to call machine_restart().  In fact, it seems to
| me that unless you are the watchdog driver, you don't want to be shutting
| the machine down.
| 
| -- 
| WWXD (What Would Xena Do?) 

I agree with Kristen.  Xena would remove it from the TODO list.

--
~Randy

--===============47934184167781213==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47934184167781213==--
