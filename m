From: Christoph Hellwig <hch@infradead.org>
Date: Sun, 31 Oct 2004 06:59:16 +0000
Subject: Re: [KJ] [RFC][PATCH 2/2] floppy: New file drivers/block/floppy.h
Message-Id: <20041031065916.GA16657@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56205071585383992=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041030194640.5280.277.23277@localhost.localdomain>
In-Reply-To: <20041030194640.5280.277.23277@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============56205071585383992==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 30, 2004 at 02:46:40PM -0500, james4765@verizon.net wrote:
> Pulled all the defines, prototypes, macros, and includes into new file floppy.h

The includes at least are always in the .c file in common linux drivers.
I don't think floppy.h is worthwhile, just put the content you added to it
ontop of floppy.h

--===============56205071585383992==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56205071585383992==--
