From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 28 Mar 2005 21:26:05 +0000
Subject: Re: [KJ] critical bug in strncpy()
Message-Id: <20050328212605.GU21986@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85712764640369077=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503281155.16199.vicente.feito@gmail.com>
In-Reply-To: <200503281155.16199.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============85712764640369077==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


There is no bug in lib/string.c's implementation of strncpy().
Most people do not realise that strncpy is a stupid function that is
almost impossible to use correctly.  Read the manpage:

       The strncpy() function is similar, except that not more than n bytes of
       src  are copied. Thus, if there is no null byte among the first n bytes
       of src, the result will not be null-terminated.

       In the case where the length of src is less than that of n, the remain-
       der of dest will be padded with nulls.

This agrees with POSIX, ANSI C and Single Unix, fwiw.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============85712764640369077==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85712764640369077==--
