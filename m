From: Pekka J Enberg <penberg@cs.Helsinki.FI>
Date: Fri, 11 Nov 2005 07:29:41 +0000
Subject: [KJ] Re: [PATCH 0/9] Cleanup mm/slab.c v2
Message-Id: <Pine.LNX.4.58.0511110928490.2001@sbz-30.cs.Helsinki.FI>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15330842174685699=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4373DD82.8010606@us.ibm.com>
In-Reply-To: <4373DD82.8010606@us.ibm.com>
To: Matthew Dobson <colpatch@us.ibm.com>
Cc: kernel-janitors@lists.osdl.org, manfred@colorfullife.com, linux-kernel@vger.kernel.org

--===============15330842174685699==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 10 Nov 2005, Matthew Dobson wrote:
> Second take at cleaning up mm/slab.c.  Patch series has picked up 2 new
> patches and dropped one old one.  The 2 new patches create new helper
> functions, and I've dropped the patch to inline 3 functions after it was
> deemed unecessary.

Looks good to me. Thanks Matthew!

				Pekka

--===============15330842174685699==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15330842174685699==--
