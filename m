From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 24 May 2004 15:28:29 +0000
Subject: Re: [Kernel-janitors] [announce] kjt patch-set for 2.6.7-rc1
Message-Id: <20040524152829.GJ1949@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62859537200662707=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040524100025.GB1949@sputnik.stro.at>
In-Reply-To: <20040524100025.GB1949@sputnik.stro.at>
To: kernel-janitors@vger.kernel.org

--===============62859537200662707==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 24 May 2004, maximilian attems wrote:

 ...
> +yield-nicedelay-sb1000
> +yield-schedtmout-cdu31a
> +yield-schedtmout-megaraid
> +yield-schedtmout-sonycd535
> the rediff versions 
> From: Gustavo Franco <stratus@acm.org>

consider those vetoed, see greg's message, should use msleep(),
will be dropped for next patch.

a++ maks


--===============62859537200662707==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62859537200662707==--
