From: Vinod Koul <vinod.koul@intel.com>
Date: Wed, 09 Dec 2015 16:14:13 +0000
Subject: Re: [patch] ASoC: Intel: Skylake: pointer math issue
Message-Id: <20151209160213.GE1854@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151208055321.GA5597@mwanda>
In-Reply-To: <20151208055321.GA5597@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Hardik T Shah <hardik.t.shah@intel.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jeeja KP <jeeja.kp@intel.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>

On Tue, Dec 08, 2015 at 08:53:22AM +0300, Dan Carpenter wrote:
> "data" is a u32 pointer so this copies the information to wrong place
> entirely.

Thanks this patch makes sense, I will test this tomorrow and get back

> 
> Fixes: 140adfba5280 ('ASoC: Intel: Skylake: Add tlv byte kcontrols')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index dde8d3c..2c4405e 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -885,9 +885,9 @@ static int skl_tplg_tlv_control_get(struct snd_kcontrol *kcontrol,
>  	if (bc->params) {
>  		if (copy_to_user(data, &bc->param_id, sizeof(u32)))
>  			return -EFAULT;
> -		if (copy_to_user(data + sizeof(u32), &size, sizeof(u32)))
> +		if (copy_to_user(data + 1, &size, sizeof(u32)))
>  			return -EFAULT;
> -		if (copy_to_user(data + 2 * sizeof(u32), bc->params, size))
> +		if (copy_to_user(data + 2, bc->params, size))
>  			return -EFAULT;
>  	}
>  

-- 
~Vinod
