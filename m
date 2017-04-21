From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 21 Apr 2017 10:43:18 +0000
Subject: Re: [PATCH] iwlwifi: pcie: missing unlock on error path
Message-Id: <87vapy2g8p.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421103937.jko3eguvfn3i6r3v@mwanda>
In-Reply-To: <20170421103937.jko3eguvfn3i6r3v@mwanda> (Dan Carpenter's message
        of "Fri, 21 Apr 2017 13:39:38 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Berg <johannes.berg@intel.com>, Sara Sharon <sara.sharon@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We should unlock before returning.
>
> Fixes: eda50cde58de ("iwlwifi: pcie: add context information support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c b/drive=
rs/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
> index 302310dfef9e..4e84955d55c8 100644
> --- a/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
> +++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
> @@ -212,8 +212,10 @@ int iwl_trans_pcie_gen2_start_fw(struct iwl_trans *t=
rans,
>  		goto out;
>  	}
> =20
> -	if (iwl_pcie_ctxt_info_init(trans, fw))
> -		return -ENOMEM;
> +	if (iwl_pcie_ctxt_info_init(trans, fw)) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}

This was recently fixed:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next=
.git/commit/?id=97b00d877bb8c2e499b9d0c07b65bd92b4e91ddd

--=20
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
