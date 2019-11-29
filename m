From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Date: Fri, 29 Nov 2019 11:54:40 +0000
Subject: Re: [PATCH] um: vector: fix BPF loading in vector drivers
Message-Id: <cccc22d6-ee0a-c219-2bf0-2b89ae07ac2b@cambridgegreys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191128174405.4244-1-anton.ivanov@cambridgegreys.com>
 <1416753c-e966-e259-a84d-2a5f0a166660@iogearbox.net>
In-Reply-To: <1416753c-e966-e259-a84d-2a5f0a166660@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Daniel Borkmann <daniel@iogearbox.net>, linux-um@lists.infradead.org
Cc: richard@nod.at, dan.carpenter@oracle.com, weiyongjun1@huawei.com, kernel-janitors@vger.kernel.org, songliubraving@fb.com, ast@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org, kafai@fb.com



On 29/11/2019 09:15, Daniel Borkmann wrote:
> On 11/28/19 6:44 PM, anton.ivanov@cambridgegreys.com wrote:
>> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>>
>> This fixes a possible hang in bpf firmware loading in the
>> UML vector io drivers due to use of GFP_KERNEL while holding
>> a spinlock.
>>
>> Based on a prposed fix by weiyongjun1@huawei.com and suggestions for
>> improving it by dan.carpenter@oracle.com
>>
>> Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
>=20
> Any reason why this BPF firmware loading mechanism in UML vector driver=20
> that was
> recently added [0] is plain old classic BPF? Quoting your commit log [0]:

It will allow whatever is allowed by sockfilter. Looking at the=20
sockfilter implementation in the kernel it takes eBPF, however even the=20
kernel docs still state BPF.

>=20
>  =C2=A0 All vector drivers now allow a BPF program to be loaded and
>  =C2=A0 associated with the RX socket in the host kernel.
>=20
>  =C2=A0 1. The program can be loaded as an extra kernel command line
>  =C2=A0 option to any of the vector drivers.
>=20
>  =C2=A0 2. The program can also be loaded as "firmware", using the
>  =C2=A0 ethtool flash option. It is possible to turn this facility
>  =C2=A0 on or off using a command line option.
>=20
>  =C2=A0 A simplistic wrapper for generating the BPF firmware for the raw
>  =C2=A0 socket driver out of a tcpdump/libpcap filter expression can be
>  =C2=A0 found at: https://github.com/kot-begemot-uk/uml_vector_utilities/
>=20
> ... it tells what it does but /nothing/ about the original rationale /=20
> use case
> why it is needed. So what is the use case? And why is this only classic=20
> BPF? Is
> there any discussion to read up that lead you to this decision of only=20
> implementing
> handling for classic BPF?

Moving processing out of the GUEST onto the HOST using a safe language.=20
The firmware load is on the GUEST and your BPF is your virtual NIC=20
"firmware" which runs on the HOST (in the host kernel in fact).

It is identical as an idea to what Netronome cards do in hardware.

>=20
> I'm asking because classic BPF is /legacy/ stuff that is on feature=20
> freeze and
> only very limited in terms of functionality compared to native (e)BPF=20
> which is
> why you need this weird 'firmware' loader [1] which wraps around tcpdump =
to
> parse the -ddd output into BPF insns ...

Because there is no other mechanism of retrieving it after it is=20
compiled by libpcap in any of the common scripting languages.

The pcap Perl, Python, Go (or whatever else) wrappers do not give you=20
access to the compiled code after the filter has been compiled.

Why is that ingenious design - you have to take it with their maintainers.

So if you want to start with pcap/tcpdump syntax and you do not want to=20
rewrite that part of tcpdump as a dumper in C you have no other choice.

The starting point is chosen because the idea is at some point to=20
replace the existing and very aged pcap network transport in UML. That=20
takes pcap syntax on the kernel command line.

I admit it is a kludge, I will probably do the "do not want" bit and=20
rewrite that in C.

In any case - the "loader" is only an example, you can compile BPF using=20
LLVM or whatever else you like.

A.

>=20
> Thanks,
> Daniel
>=20
>  =C2=A0 [0]=20
> https://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git/commit/?h=3Dli=
nux-next&id=9807019a62dc670c73ce8e59e09b41ae458c34b3=20
>=20
>  =C2=A0 [1]=20
> https://github.com/kot-begemot-uk/uml_vector_utilities/blob/master/build_=
bpf_firmware.py=20
>=20
>=20
>> =C2=A0 arch/um/drivers/vector_kern.c | 38 ++++++++++++++++++------------=
-----
>> =C2=A0 1 file changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/um/drivers/vector_kern.c=20
>> b/arch/um/drivers/vector_kern.c
>> index 92617e16829e..dbbc6e850fdd 100644
>> --- a/arch/um/drivers/vector_kern.c
>> +++ b/arch/um/drivers/vector_kern.c
>> @@ -1387,6 +1387,7 @@ static int vector_net_load_bpf_flash(struct=20
>> net_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vector_private *vp =3D netdev_priv=
(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vector_device *vdevice;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct firmware *fw;
>> +=C2=A0=C2=A0=C2=A0 void *new_filter;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int result =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(vp->options & VECTOR_BPF_FLASH)) {
>> @@ -1394,6 +1395,15 @@ static int vector_net_load_bpf_flash(struct=20
>> net_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 vdevice =3D find_device(vp->unit);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (request_firmware(&fw, efl->data, &vdevice->pdev.=
dev))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> +
>> +=C2=A0=C2=A0=C2=A0 new_filter =3D kmemdup(fw->data, fw->size, GFP_KERNE=
L);
>> +=C2=A0=C2=A0=C2=A0 if (!new_filter)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto free_buffer;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&vp->lock);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vp->bpf !=3D NULL) {
>> @@ -1402,41 +1412,33 @@ static int vector_net_load_bpf_flash(struct=20
>> net_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(vp->bpf->fi=
lter);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vp->bpf->filter =
=3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vp->bpf =3D kmalloc(sizeof(s=
truct sock_fprog), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vp->bpf =3D kmalloc(sizeof(s=
truct sock_fprog), GFP_ATOMIC);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vp->bpf =3D N=
ULL) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 netdev_err(dev, "failed to allocate memory for=20
>> firmware\n");
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto=
 flash_fail;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto=
 apply_flash_fail;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 vdevice =3D find_device(vp->unit);
>> -
>> -=C2=A0=C2=A0=C2=A0 if (request_firmware(&fw, efl->data, &vdevice->pdev.=
dev))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto flash_fail;
>> -
>> -=C2=A0=C2=A0=C2=A0 vp->bpf->filter =3D kmemdup(fw->data, fw->size, GFP_=
KERNEL);
>> -=C2=A0=C2=A0=C2=A0 if (!vp->bpf->filter)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto free_buffer;
>> -
>> +=C2=A0=C2=A0=C2=A0 vp->bpf->filter =3D new_filter;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vp->bpf->len =3D fw->size / sizeof(struct=
 sock_filter);
>> -=C2=A0=C2=A0=C2=A0 release_firmware(fw);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vp->opened)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D uml_ve=
ctor_attach_bpf(vp->fds->rx_fd, vp->bpf);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&vp->lock);
>> -=C2=A0=C2=A0=C2=A0 return result;
>> -
>> -free_buffer:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_firmware(fw);
>> -flash_fail:
>> +=C2=A0=C2=A0=C2=A0 return result;
>> +
>> +apply_flash_fail:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&vp->lock);
>> -=C2=A0=C2=A0=C2=A0 if (vp->bpf !=3D NULL)
>> +=C2=A0=C2=A0=C2=A0 if (vp->bpf)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(vp->bpf->fi=
lter);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(vp->bpf);
>> -=C2=A0=C2=A0=C2=A0 vp->bpf =3D NULL;
>> +
>> +free_buffer:
>> +=C2=A0=C2=A0=C2=A0 release_firmware(fw);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>> =C2=A0 }
>>
>=20
>=20

--=20
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
