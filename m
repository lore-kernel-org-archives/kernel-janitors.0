From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Sun, 03 May 2015 10:29:54 +0000
Subject: Re: [PATCH] staging: lustre: obd_support: Add obd_cpt_alloc function
Message-Id: <CFEDDBDC-DAD6-44B1-816B-233E9FFE19BB@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430601408-12847-1-git-send-email-Julia.Lawall@lip6.fr>
 <D7D0EE01-6BD2-498F-88D5-CC3829A39561@intel.com>
 <alpine.DEB.2.02.1505030751020.2068@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1505030751020.2068@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "Dilger, Andreas" <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "<HPDD-discuss@lists.01.org>" <HPDD-discuss@ml01.01.org>, "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>


On May 3, 2015, at 1:53 AM, Julia Lawall wrote:

> On Sat, 2 May 2015, Drokin, Oleg wrote:
>=20
>>=20
>> On May 2, 2015, at 5:16 PM, Julia Lawall wrote:
>>=20
>>> Summarize OBD_CPT_ALLOC_GFP, OBD_CPT_ALLOC, and OBD_CPT_ALLOC_PTR as a
>>> function, obd_cpt_alloc.
>>>=20
>>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>>>=20
>>> ---
>>>=20
>>> Some questions: Is the name OK?  Is the NULL test needed?  If not, shou=
ld
>>> the call to kzalloc_node with the call to cfs_cpt_spread_node just be
>>> inlined into the call sites?
>>=20
>> I think we don't need this function at all, we can use kzalloc/kzalloc_n=
ode directly with cfs_cpt_spread_node call in.
>=20
> So everywhere the CPT macro is called, it is known that the value is not =

> NULL?  I looked at some call sites, but it's not obvious to determine=20
> that.

It's not obvious, but I believe this is true now.

Basically in lustre/ptlrpc/service.c we use service->srv_cptable
and that comes from ptlrpc_register_service:
        cptable =3D cconf->cc_cptable;
        if (cptable =3D NULL)
                cptable =3D cfs_cpt_table;
=85.
        service->srv_cptable            =3D cptable;
        service->srv_cpts               =3D cpts;
        service->srv_ncpts              =3D ncpts;

that on the client it's only called from:
lustre/ldlm/ldlm_lockd.c::ldlm_setup() where we unconditionally assign
                .psc_cpt                =3D {
                        .cc_pattern             =3D ldlm_cpts,
                },
But even if there was a different caller, we always use cfs_cpt_table as fa=
llback.

It's also directly used in ptlrpc_hr_init():
        ptlrpc_hr.hr_cpt_table =3D cfs_cpt_table;

Two callers in lustre/ptlrpc/nrs.c use the same stuff as above.

One caller in lustre/ptlrpc/nrs_fifo.c uses nrs_pol2cptab which is defined =
as
nrs_pol2svc(policy)->srv_cptable which is again same as above.

There are no other callers.

Bye,
    Oleg--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
