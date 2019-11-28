From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Date: Thu, 28 Nov 2019 09:24:12 +0000
Subject: Re: [PATCH -next] um: vector: use GFP_ATOMIC under spin lock
Message-Id: <ceedf42c-2dc0-df2e-cf3f-323c675dec78@cambridgegreys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191128020147.191893-1-weiyongjun1@huawei.com>
 <20191128080641.GD1781@kadam>
 <5892ee7c-ff24-fb3c-6911-44e0b1d5895f@cambridgegreys.com>
 <1784077834.99875.1574930472125.JavaMail.zimbra@nod.at>
In-Reply-To: <1784077834.99875.1574930472125.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Richard Weinberger <richard@nod.at>
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, linux-um <linux-um@lists.infradead.org>, Jeff Dike <jdike@addtoit.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, netdev <netdev@vger.kernel.org>, bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>, Dan Carpenter <dan.carpenter@oracle.com>



On 28/11/2019 08:41, Richard Weinberger wrote:
> ----- Urspr=C3=BCngliche Mail -----
>> Von: "anton ivanov" <anton.ivanov@cambridgegreys.com>
>> An: "Dan Carpenter" <dan.carpenter@oracle.com>, "Wei Yongjun" <weiyongju=
n1@huawei.com>
>> CC: "Song Liu" <songliubraving@fb.com>, "Daniel Borkmann" <daniel@iogear=
box.net>, "kernel-janitors"
>> <kernel-janitors@vger.kernel.org>, "richard" <richard@nod.at>, "Jeff Dik=
e" <jdike@addtoit.com>, "linux-um"
>> <linux-um@lists.infradead.org>, "Alexei Starovoitov" <ast@kernel.org>, "=
netdev" <netdev@vger.kernel.org>,
>> bpf@vger.kernel.org, "Martin KaFai Lau" <kafai@fb.com>
>> Gesendet: Donnerstag, 28. November 2019 09:18:30
>> Betreff: Re: [PATCH -next] um: vector: use GFP_ATOMIC under spin lock
>=20
>> On 28/11/2019 08:06, Dan Carpenter wrote:
>>> On Thu, Nov 28, 2019 at 02:01:47AM +0000, Wei Yongjun wrote:
>>>> A spin lock is taken here so we should use GFP_ATOMIC.
>>>>
>>>> Fixes: 9807019a62dc ("um: Loadable BPF "Firmware" for vector drivers")
>>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>>> ---
>>>>    arch/um/drivers/vector_kern.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_ke=
rn.c
>>>> index 92617e16829e..6ff0065a271d 100644
>>>> --- a/arch/um/drivers/vector_kern.c
>>>> +++ b/arch/um/drivers/vector_kern.c
>>>> @@ -1402,7 +1402,7 @@ static int vector_net_load_bpf_flash(struct net_=
device
>>>> *dev,
>>>>    		kfree(vp->bpf->filter);
>>>>    		vp->bpf->filter =3D NULL;
>>>>    	} else {
>>>> -		vp->bpf =3D kmalloc(sizeof(struct sock_fprog), GFP_KERNEL);
>>>> +		vp->bpf =3D kmalloc(sizeof(struct sock_fprog), GFP_ATOMIC);
>>>>    		if (vp->bpf =3D NULL) {
>>>>    			netdev_err(dev, "failed to allocate memory for firmware\n");
>>>>    			goto flash_fail;
>>>> @@ -1414,7 +1414,7 @@ static int vector_net_load_bpf_flash(struct net_=
device
>>>> *dev,
>>>>    	if (request_firmware(&fw, efl->data, &vdevice->pdev.dev))
>>>               ^^^^^^^^^^^^^^^^
>>>
>>> Is it really possible to call request_firmware() while holding a
>>> spin_lock?  I was so sure that read from the disk.
>>
>> Works, I tested the patch quite a few times.
>=20
> It works because of the nature of UML ->no  SMP or PREEMPT.
> But better request the firmware before taking the spinlock.
> request_firmware() can block.
> Same for the kmalloc(), just allocate the buffer before and then assign
> the pointer under the lock. That way you don't need GFP_ATOMIC.

Ack.

I will make an incremental on top of the existing patch (as that is=20
already in -next

Brgds,

>=20
> Thanks,
> //richard
>=20
> _______________________________________________
> linux-um mailing list
> linux-um@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-um
>=20

--=20
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
