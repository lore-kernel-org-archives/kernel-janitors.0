From: David Gibson <hermes@gibson.dropbear.id.au>
Date: Fri, 30 Jul 2004 03:01:13 +0000
Subject: [Kernel-janitors] Re: [PATCH] wireless/orinoco_tmd: replace
Message-Id: <20040730030113.GB22225@zax>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57329445597514628=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727205828.GI3471@us.ibm.com>
In-Reply-To: <20040727205828.GI3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============57329445597514628==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 01:58:44PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee
> the task delays for the desired time.

I've merged these changes into the orinoco CVS tree, so there won't be
conflicts as I merge with mainline.

-- 
David Gibson			| For every complex problem there is a
david AT gibson.dropbear.id.au	| solution which is simple, neat and
				| wrong.
http://www.ozlabs.org/people/dgibson

--===============57329445597514628==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57329445597514628==--
