From: Carlo Perassi <carlo@linux.it>
Date: Mon, 07 Mar 2005 18:32:39 +0000
Subject: [KJ] Re: [PATCH] hcd.c
Message-Id: <20050307183239.GA5416@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============461548687781419=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503070911.24729.david-b@pacbell.net>
In-Reply-To: <200503070911.24729.david-b@pacbell.net>
To: kernel-janitors@vger.kernel.org

--===============461548687781419==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> ... etc, since the initializer has ((constant >> constant) & constant)
> constructs.  I suspect that either you're using a broken GCC or you're
> seeing the results of hacking <linux/version.h> in ways that break

Maybe the first option is true, because some days ago I was able to
compile the same kernel without problem (later, updating the system and
gcc I was no more able to compile it... at that time I guessed it was
about a gcc problem or some more "strict" gcc checks with the new
sub-release).

Thank you.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============461548687781419==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============461548687781419==--
