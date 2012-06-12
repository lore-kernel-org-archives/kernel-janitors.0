From: Yinghai Lu <yinghai@kernel.org>
Date: Tue, 12 Jun 2012 16:44:45 +0000
Subject: Re: [patch -next] irq_remap: silence a bogus pr_err()
Message-Id: <CAE9FiQWG37f4E+ys2uXzrTSHbmhmF2gx+df0eqfRZ_JnKhCC2Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120612162633.GA11077@elgon.mountain>
In-Reply-To: <20120612162633.GA11077@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexander Gordeev <agordeev@redhat.com>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 12, 2012 at 9:26 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> There is an extra semicolon here so the pr_err() message is printed when
> it is not intended.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/iommu/intel_irq_remapping.c b/drivers/iommu/intel_ir=
q_remapping.c
> index dafbad0..853902a 100644
> --- a/drivers/iommu/intel_irq_remapping.c
> +++ b/drivers/iommu/intel_irq_remapping.c
> @@ -938,7 +938,7 @@ intel_ioapic_set_affinity(struct irq_data *data, cons=
t struct cpumask *mask,
>
> =A0 =A0 =A0 =A0err =3D apic->cpu_mask_to_apicid_and(cfg->domain, mask, &d=
est);
> =A0 =A0 =A0 =A0if (err) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (assign_irq_vector(irq, cfg, data->affin=
ity));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (assign_irq_vector(irq, cfg, data->affin=
ity))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_err("Failed to recover =
vector for irq %d\n", irq);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return err;
> =A0 =A0 =A0 =A0}

introduced by:

commit ff164324123c0fe181d8de7dadcc7b3fbe25f2cf
Author: Alexander Gordeev <agordeev@redhat.com>
Date:   Thu Jun 7 15:15:59 2012 +0200

    x86/apic: Make cpu_mask_to_apicid() operations return error code
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
