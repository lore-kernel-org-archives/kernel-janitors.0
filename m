From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 20 Dec 2005 13:54:38 +0000
Subject: Re: [KJ] [Patch 2/5] Cleanup MIN/MAX Macro usage in eicon/di.c
Message-Id: <20051220135438.GU2361@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0099020606655955135=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1135084556.24065.6.camel@alice>
In-Reply-To: <1135084556.24065.6.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============0099020606655955135==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 20, 2005 at 02:15:56PM +0100, Eric Sesterhenn / snakebyte wrote:
> -      clength = MIN((word)(270-length),X[i].PLength-this->XOffset);
> +      clength = min((word)(270-length),(word)(X[i].PLength-this->XOffset));

perhaps you should use min_t?

> -        IoAdapter->RBuffer.length = MIN(MLength, 270);
> +        IoAdapter->RBuffer.length = min((word)MLength, (word)270);

likewise.

> -        clength = MIN(MLength, R[this->RCurrent].PLength-this->ROffset);
> +        clength = min(MLength, (word)(R[this->RCurrent].PLength-this->ROffset));

likewise.



--===============0099020606655955135==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0099020606655955135==--
