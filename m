From: Nitesh Narayan Lal <nitesh@redhat.com>
Date: Fri, 22 Nov 2019 11:58:51 +0000
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
Message-Id: <b24e2efc-2228-95ea-09b0-806a9b066eee@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="EqvGeaEVLHBRAwBF8Qf28rvqlOMa5LsGj"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119030640.25097-1-maowenan@huawei.com>
 <87o8x8gjr5.fsf@vitty.brq.redhat.com> <20191119121423.GB5604@kadam>
 <87imnggidr.fsf@vitty.brq.redhat.com> <20191119123956.GC5604@kadam>
 <87a78sgfqj.fsf@vitty.brq.redhat.com>
In-Reply-To: <87a78sgfqj.fsf@vitty.brq.redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mao Wenan <maowenan@huawei.com>, pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EqvGeaEVLHBRAwBF8Qf28rvqlOMa5LsGj
Content-Type: multipart/mixed; boundary="4kUcYUHF2NIDUEJAQFa8Nid8qDSi46TpB";
 protected-headers="v1"
From: Nitesh Narayan Lal <nitesh@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mao Wenan <maowenan@huawei.com>, pbonzini@redhat.com, rkrcmar@redhat.com,
 sean.j.christopherson@intel.com, wanpengli@tencent.com, jmattson@google.com,
 joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>
Message-ID: <b24e2efc-2228-95ea-09b0-806a9b066eee@redhat.com>
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
References: <20191119030640.25097-1-maowenan@huawei.com>
 <87o8x8gjr5.fsf@vitty.brq.redhat.com> <20191119121423.GB5604@kadam>
 <87imnggidr.fsf@vitty.brq.redhat.com> <20191119123956.GC5604@kadam>
 <87a78sgfqj.fsf@vitty.brq.redhat.com>
In-Reply-To: <87a78sgfqj.fsf@vitty.brq.redhat.com>

--4kUcYUHF2NIDUEJAQFa8Nid8qDSi46TpB
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 11/19/19 8:25 AM, Vitaly Kuznetsov wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>
>> On Tue, Nov 19, 2019 at 01:28:32PM +0100, Vitaly Kuznetsov wrote:
>>> Dan Carpenter <dan.carpenter@oracle.com> writes:
>>>
>>>> On Tue, Nov 19, 2019 at 12:58:54PM +0100, Vitaly Kuznetsov wrote:
>>>>> Mao Wenan <maowenan@huawei.com> writes:
>>>>>
>>>>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>>>>
>>>>>> arch/x86/kvm/x86.c: In function kvm_make_scan_ioapic_request_mask:
>>>>>> arch/x86/kvm/x86.c:7911:7: warning: variable called set but not
>>>>>> used [-Wunused-but-set-variable]
>>>>>>
>>>>>> It is not used since commit 7ee30bc132c6 ("KVM: x86: deliver KVM
>>>>>> IOAPIC scan request to target vCPUs")
>>>>> Better expressed as=20
>>>>>
>>>>> Fixes: 7ee30bc132c6 ("KVM: x86: deliver KVM IOAPIC scan request to ta=
rget vCPUs")
>>>>>
>>>> There is sort of a debate about this whether the Fixes tag should be
>>>> used if it's only a cleanup.
>>>>
>>> I have to admit I'm involved in doing backporting sometimes and I reall=
y
>>> appreciate Fixes: tags. Just so you know on which side of the debate I
>>> am :-)
>> But we're not going to backport this hopefully?
>>
> In case we're speaking about stable@ kernels, 7ee30bc132c6 doesn't look
> like a good candidate (to me) but who knows, it may get pulled in
> because of some code dependency or some other 'autosel magic'. And
> that's when 'Fixes:' tags become handy.

Anything I can improve upon? If required I can send fixes on top of it.
For the build error, I didn't trigger it because I didn't compile with
appropriate flags.
I will make a note for myself for next time.

Thanks, Mao for sending the fix.

>
--=20
Nitesh


--4kUcYUHF2NIDUEJAQFa8Nid8qDSi46TpB--

--EqvGeaEVLHBRAwBF8Qf28rvqlOMa5LsGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkXcoRVGaqvbHPuAGo4ZA3AYyozkFAl3XzXsACgkQo4ZA3AYy
ozmPXhAAzY8NtCTe7lRLjXFQ+Tjb5zUYNExVBBC8gNOjDyPNf8CQ57SEFdJm4oUb
nxTlflLIz380o8Wj/n5+nsQZRYf8HtPP8qb07JuNBgtLnsJVtZGV7TrYSVp6gtCz
w/R2QnO9h3zpqrCiKFTJQ0vGSftg/RzDwGCZQz5jiR+0U0RDjrrAmaGerQb4RM/w
nxBzubz3kUhNkvHb4keyc/Fmlezwd7oQ96Wugn2lxksoKvacGrHn9oRdvIOP10N4
L/9TIlmrrwtsNfsMt/N9O+2aorjRv75w/RFxzKf6UlETmBOSwDjS0n6GgrLSWqg+
GRXgzjeAHaaGKXsXKj/L+5BRMPdab9YDD8/CdDD3rqBs75Xp6MPm7U5+aA1ata+2
VOL2hIuAqmd8XmKJa9K+7Xyu0SUz/49j9lQrUbV19bI2iHsAcF41t4RL5xOunmOn
zR3hNa0IPpHLZYrJ0hjAJffSQsbllIfUhc0st3gnDBn45alq93AeKOExBw5qNj2l
JbkEP2Al1i1tGEgTKwxvB/gNN8hZel5mK7PlH50rxjrSlCMuuqBK8t5XkyjIe8SL
Dj3fuvM29VOo3ti7Jr0ZCA6Qr3tGWiz/h5gvnnt9DzftLJLNA5cnO9qFXZq0uzFQ
DCsDqhQ6fYj38MqKttF+qu1T7cfjZ4MYKC3dUpnwBBXTehpXMlU=
=euBu
-----END PGP SIGNATURE-----

--EqvGeaEVLHBRAwBF8Qf28rvqlOMa5LsGj--
