From: Jim Nelson <james4765@verizon.net>
Date: Sun, 31 Oct 2004 13:08:06 +0000
Subject: Re: [KJ] [RFC][PATCH 2/2] floppy: New file drivers/block/floppy.h
Message-Id: <4184E3B6.2030200@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67061083397496324=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041030194640.5280.277.23277@localhost.localdomain>
In-Reply-To: <20041030194640.5280.277.23277@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============67061083397496324==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Christoph Hellwig wrote:
> On Sat, Oct 30, 2004 at 02:46:40PM -0500, james4765@verizon.net wrote:
> 
>>Pulled all the defines, prototypes, macros, and includes into new file floppy.h
> 
> 
> The includes at least are always in the .c file in common linux drivers.
> I don't think floppy.h is worthwhile, just put the content you added to it
> ontop of floppy.h
> 

All right.  One more bit of information to add to the "how things work around 
here".  Time for a whacking-huge patch.

Thanks,
Jim

--===============67061083397496324==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67061083397496324==--
