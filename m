From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 28 Mar 2006 17:06:38 +0000
Subject: Re: [KJ][Patch][update] fix kbuild warning in iptable_nat.o
Message-Id: <20060328170638.GC5900@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2786406031400005=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143548373.14792.9.camel@localhost.localdomain>
In-Reply-To: <1143548373.14792.9.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============2786406031400005==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 28.03.2006 [23:19:33 +1100], Darren Jenkins" wrote:

<snip>

> As iptable_nat.o seems to be compiled into the kernel (from
> ip_nat_rule.c and ip_nat_standalone.c) by default, I don't think we need
> the __exit function (correct me if I am wrong).

<snip>

What happens when we do build NAT filtering support as a module? Just
because the default is non-modular, does not mean we can ignore the
option.

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center

--===============2786406031400005==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2786406031400005==--
