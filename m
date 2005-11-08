From: Pekka J Enberg <penberg@cs.Helsinki.FI>
Date: Tue, 08 Nov 2005 07:58:32 +0000
Subject: [KJ] Re: [PATCH 0/8] Cleanup slab.c
Message-Id: <Pine.LNX.4.58.0511080956110.10273@sbz-30.cs.Helsinki.FI>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2451353088360495=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com>
In-Reply-To: <436FF51D.8080509@us.ibm.com>
To: Matthew Dobson <colpatch@us.ibm.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, manfred@colorfullife.com

--===============2451353088360495==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 7 Nov 2005, Matthew Dobson wrote:
> Since there was some (albeit very brief) discussion last week about the
> need to cleanup mm/slab.c, I figured I'd post these patches.  I was
> inspired to cleanup mm/slab.c since I'm working on a project (to be posted
> shortly) that touched a bunch of slab code.  I found slab.c to be
> inconsistent, to say the least.

Thank you for doing this. Overall, they look good to me except for the 
bits I commented on. In future, please inline patches to the mail and cc
Manfred Spraul who more or less maintains mm/slab.c (curiously, I see no
entry in MAINTAINERS though).

			Pekka

--===============2451353088360495==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2451353088360495==--
