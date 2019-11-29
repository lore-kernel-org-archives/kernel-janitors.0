From: Daniel Borkmann <daniel@iogearbox.net>
Date: Fri, 29 Nov 2019 09:15:29 +0000
Subject: Re: [PATCH] um: vector: fix BPF loading in vector drivers
Message-Id: <1416753c-e966-e259-a84d-2a5f0a166660@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191128174405.4244-1-anton.ivanov@cambridgegreys.com>
In-Reply-To: <20191128174405.4244-1-anton.ivanov@cambridgegreys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: anton.ivanov@cambridgegreys.com, linux-um@lists.infradead.org
Cc: richard@nod.at, dan.carpenter@oracle.com, weiyongjun1@huawei.com, kernel-janitors@vger.kernel.org, songliubraving@fb.com, ast@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, kafai@fb.com

On 11/28/19 6:44 PM, anton.ivanov@cambridgegreys.com wrote:
> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>=20
> This fixes a possible hang in bpf firmware loading in the
> UML vector io drivers due to use of GFP_KERNEL while holding
> a spinlock.
>=20
> Based on a prposed fix by weiyongjun1@huawei.com and suggestions for
> improving it by dan.carpenter@oracle.com
>=20
> Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>

Any reason why this BPF firmware loading mechanism in UML vector driver tha=
t was
recently added [0] is plain old classic BPF? Quoting your commit log [0]:

   All vector drivers now allow a BPF program to be loaded and
   associated with the RX socket in the host kernel.

   1. The program can be loaded as an extra kernel command line
   option to any of the vector drivers.

   2. The program can also be loaded as "firmware", using the
   ethtool flash option. It is possible to turn this facility
   on or off using a command line option.

   A simplistic wrapper for generating the BPF firmware for the raw
   socket driver out of a tcpdump/libpcap filter expression can be
   found at: https://github.com/kot-begemot-uk/uml_vector_utilities/

... it tells what it does but /nothing/ about the original rationale / use =
case
why it is needed. So what is the use case? And why is this only classic BPF=
? Is
there any discussion to read up that lead you to this decision of only impl=
ementing
handling for classic BPF?

I'm asking because classic BPF is /legacy/ stuff that is on feature freeze =
and
only very limited in terms of functionality compared to native (e)BPF which=
 is
why you need this weird 'firmware' loader [1] which wraps around tcpdump to
parse the -ddd output into BPF insns ...

Thanks,
Daniel

   [0] https://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git/commit/?h=
=3Dlinux-next&id=9807019a62dc670c73ce8e59e09b41ae458c34b3
   [1] https://github.com/kot-begemot-uk/uml_vector_utilities/blob/master/b=
uild_bpf_firmware.py

>   arch/um/drivers/vector_kern.c | 38 ++++++++++++++++++-----------------
>   1 file changed, 20 insertions(+), 18 deletions(-)
>=20
> diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
> index 92617e16829e..dbbc6e850fdd 100644
> --- a/arch/um/drivers/vector_kern.c
> +++ b/arch/um/drivers/vector_kern.c
> @@ -1387,6 +1387,7 @@ static int vector_net_load_bpf_flash(struct net_dev=
ice *dev,
>   	struct vector_private *vp =3D netdev_priv(dev);
>   	struct vector_device *vdevice;
>   	const struct firmware *fw;
> +	void *new_filter;
>   	int result =3D 0;
>  =20
>   	if (!(vp->options & VECTOR_BPF_FLASH)) {
> @@ -1394,6 +1395,15 @@ static int vector_net_load_bpf_flash(struct net_de=
vice *dev,
>   		return -1;
>   	}
>  =20
> +	vdevice =3D find_device(vp->unit);
> +
> +	if (request_firmware(&fw, efl->data, &vdevice->pdev.dev))
> +		return -1;
> +
> +	new_filter =3D kmemdup(fw->data, fw->size, GFP_KERNEL);
> +	if (!new_filter)
> +		goto free_buffer;
> +
>   	spin_lock(&vp->lock);
>  =20
>   	if (vp->bpf !=3D NULL) {
> @@ -1402,41 +1412,33 @@ static int vector_net_load_bpf_flash(struct net_d=
evice *dev,
>   		kfree(vp->bpf->filter);
>   		vp->bpf->filter =3D NULL;
>   	} else {
> -		vp->bpf =3D kmalloc(sizeof(struct sock_fprog), GFP_KERNEL);
> +		vp->bpf =3D kmalloc(sizeof(struct sock_fprog), GFP_ATOMIC);
>   		if (vp->bpf =3D NULL) {
>   			netdev_err(dev, "failed to allocate memory for firmware\n");
> -			goto flash_fail;
> +			goto apply_flash_fail;
>   		}
>   	}
>  =20
> -	vdevice =3D find_device(vp->unit);
> -
> -	if (request_firmware(&fw, efl->data, &vdevice->pdev.dev))
> -		goto flash_fail;
> -
> -	vp->bpf->filter =3D kmemdup(fw->data, fw->size, GFP_KERNEL);
> -	if (!vp->bpf->filter)
> -		goto free_buffer;
> -
> +	vp->bpf->filter =3D new_filter;
>   	vp->bpf->len =3D fw->size / sizeof(struct sock_filter);
> -	release_firmware(fw);
>  =20
>   	if (vp->opened)
>   		result =3D uml_vector_attach_bpf(vp->fds->rx_fd, vp->bpf);
>  =20
>   	spin_unlock(&vp->lock);
>  =20
> -	return result;
> -
> -free_buffer:
>   	release_firmware(fw);
>  =20
> -flash_fail:
> +	return result;
> +
> +apply_flash_fail:
>   	spin_unlock(&vp->lock);
> -	if (vp->bpf !=3D NULL)
> +	if (vp->bpf)
>   		kfree(vp->bpf->filter);
>   	kfree(vp->bpf);
> -	vp->bpf =3D NULL;
> +
> +free_buffer:
> +	release_firmware(fw);
>   	return -1;
>   }
>  =20
>=20
