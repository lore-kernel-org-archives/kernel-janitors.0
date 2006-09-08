From: Jim Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 03:24:48 +0000
Subject: Re: [KJ] [PATCH 00/72] arm: add KERN_ constants to files in
Message-Id: <4500E280.5080903@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060908015622.10114.66478.sendpatchset@david.homenet>
In-Reply-To: <20060908015622.10114.66478.sendpatchset@david.homenet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthew Wilcox wrote:
> On Thu, Sep 07, 2006 at 09:56:22PM -0400, James Nelson wrote:
>> This series of patches add appropriate KERN_ constants to printk()s in the rest of
>> the files in /arch/arm.  It also reworks some debug #defines to make their operation
>> more clear.
> 
> Posting a 72 part series is completely unreasonable.  Never do this again.
> Find a better way of splitting it up -- maybe by directory.  One patch
> per file is ridiculous.

You are right.  I will have to re-work the script I use to package everything up
- - I haven't done this much work in one shot before...

My apologies.

Jim

- --
GPG key available
gpg --keyserver pgp.mit.edu --recv-keys 06B386612

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFAOJ/XxNjpms4ZhIRAuzDAJ9ZYntb/iC9JmnZYnmZo//Kp42HiACgoxt7
i/1/+lgUTU6VUX5vT9h8uyk=m9cx
-----END PGP SIGNATURE-----
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
