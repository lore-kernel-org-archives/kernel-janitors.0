From: Matt Turner <mattst88@gmail.com>
Date: Sun, 19 Sep 2010 04:52:50 +0000
Subject: Re: [PATCH 2/4] alpha: remove cast from void*
Message-Id: <AANLkTim4ieLZQEw11vNLzw2UCgruCWRy960eab2cn+74@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284442059-11641-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1284442059-11641-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Sep 14, 2010 at 1:27 AM, matt mooney <mfm@muteddisk.com> wrote:
> Unnecessary cast from void* in assignment.
>
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---
> =A0arch/alpha/kernel/pci-sysfs.c | =A0 =A02 +-
> =A0arch/alpha/kernel/srm_env.c =A0 | =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
> index 738fc82..b899e95 100644
> --- a/arch/alpha/kernel/pci-sysfs.c
> +++ b/arch/alpha/kernel/pci-sysfs.c
> @@ -66,7 +66,7 @@ static int pci_mmap_resource(struct kobject *kobj,
> =A0{
> =A0 =A0 =A0 =A0struct pci_dev *pdev =3D to_pci_dev(container_of(kobj,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct device, kobj));
> - =A0 =A0 =A0 struct resource *res =3D (struct resource *)attr->private;
> + =A0 =A0 =A0 struct resource *res =3D attr->private;
> =A0 =A0 =A0 =A0enum pci_mmap_state mmap_type;
> =A0 =A0 =A0 =A0struct pci_bus_region bar;
> =A0 =A0 =A0 =A0int i;
> diff --git a/arch/alpha/kernel/srm_env.c b/arch/alpha/kernel/srm_env.c
> index 4afc1a1..f0df3fb 100644
> --- a/arch/alpha/kernel/srm_env.c
> +++ b/arch/alpha/kernel/srm_env.c
> @@ -87,7 +87,7 @@ static int srm_env_proc_show(struct seq_file *m, void *=
v)
> =A0 =A0 =A0 =A0srm_env_t =A0 =A0 =A0 *entry;
> =A0 =A0 =A0 =A0char =A0 =A0 =A0 =A0 =A0 =A0*page;
>
> - =A0 =A0 =A0 entry =3D (srm_env_t *)m->private;
> + =A0 =A0 =A0 entry =3D m->private;
> =A0 =A0 =A0 =A0page =3D (char *)__get_free_page(GFP_USER);
> =A0 =A0 =A0 =A0if (!page)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> --
> 1.7.2.1

Thanks! Applied.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
