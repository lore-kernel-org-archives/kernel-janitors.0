From: Nitesh Narayan Lal <nitesh@redhat.com>
Date: Fri, 22 Nov 2019 12:45:25 +0000
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
Message-Id: <ed1d438b-9f0f-0e33-51cc-12ad316aa18c@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7eebgi68NEWUnr0qnwcAQKeBn2ZnM0aEi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119030640.25097-1-maowenan@huawei.com>
 <87o8x8gjr5.fsf@vitty.brq.redhat.com> <20191119121423.GB5604@kadam>
 <87imnggidr.fsf@vitty.brq.redhat.com> <20191119123956.GC5604@kadam>
 <87a78sgfqj.fsf@vitty.brq.redhat.com>
 <b24e2efc-2228-95ea-09b0-806a9b066eee@redhat.com>
 <20191122120413.GI617@kadam>
In-Reply-To: <20191122120413.GI617@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Mao Wenan <maowenan@huawei.com>, pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com, wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7eebgi68NEWUnr0qnwcAQKeBn2ZnM0aEi
Content-Type: multipart/mixed; boundary="8cMCPFfHHLuxBfx8pFoGN3HdS0JmIADqe";
 protected-headers="v1"
From: Nitesh Narayan Lal <nitesh@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Mao Wenan <maowenan@huawei.com>,
 pbonzini@redhat.com, rkrcmar@redhat.com, sean.j.christopherson@intel.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>
Message-ID: <ed1d438b-9f0f-0e33-51cc-12ad316aa18c@redhat.com>
Subject: Re: [PATCH -next] KVM: x86: remove set but not used variable 'called'
References: <20191119030640.25097-1-maowenan@huawei.com>
 <87o8x8gjr5.fsf@vitty.brq.redhat.com> <20191119121423.GB5604@kadam>
 <87imnggidr.fsf@vitty.brq.redhat.com> <20191119123956.GC5604@kadam>
 <87a78sgfqj.fsf@vitty.brq.redhat.com>
 <b24e2efc-2228-95ea-09b0-806a9b066eee@redhat.com>
 <20191122120413.GI617@kadam>
In-Reply-To: <20191122120413.GI617@kadam>

--8cMCPFfHHLuxBfx8pFoGN3HdS0JmIADqe
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 11/22/19 7:25 AM, Dan Carpenter wrote:
> On Fri, Nov 22, 2019 at 06:58:51AM -0500, Nitesh Narayan Lal wrote:
>> For the build error, I didn't trigger it because I didn't compile with
>> appropriate flags.
> It's going to be a serveral years before we can enable that flag by
> default.

I see I have made a note of it so that I can do it before sending the patch=
es.

> regards,
> dan carpenter
>
--=20
Thanks
Nitesh


--8cMCPFfHHLuxBfx8pFoGN3HdS0JmIADqe--

--7eebgi68NEWUnr0qnwcAQKeBn2ZnM0aEi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkXcoRVGaqvbHPuAGo4ZA3AYyozkFAl3X2GUACgkQo4ZA3AYy
ozncxA/+NydE9O11tyCKGrzbLSzgDycPi8wO51qYta8Uykb6NyYefSAPZluM2WwR
Png3Oi5vUKibO90UF1F20baW7MWv/RJ4KH6COOKxVJX/CSSjBlm6OtQ+KfKTwkYS
hzfXtQwXKW5zYO+AEgHyjLM4u2sDJ7W88prpA0CLraVQq3ZjRhCSru0QG3NmB2Oj
baYlDmeuxe32hLYk7gSkLzZrs9i228bNS1jg61NOLER215HOBI/XMKBZ/0fUm2Nl
R5BZ3JlbsAgooForjpJDu4L6l7mZ+CiWLTVdDNrNN4X4vsZM/rva6vUDboRNDOjs
sj4kuV0RVPkNk2HTxSKHMhYa7mCC5MUOv8cEcsP+USRMRZlBMBp8ulPg89dOv9Dr
NpM+mflmWGIVwPGmLdk3N6Z9O090vkqN1ZUlqCXrXzClYp+vxpzf7O4aRGD/q3GK
9PSD8yxjQ3MU0eCalnCupMcxku10fi+R6nODaNf8A53fTI/CltENm7svS0X2euJ1
y0HaadrHqCwANGZtooMM4I40x3FNpRX3dXMFn2nfV5EXZQFJOVQKEXYGNgFGkV4/
z70xFMni/i+lxlaIvtxWi9qV8KrChJigYwuK/0/jbb7M6VxgvVOe+wAO5+CxZ1xc
dxXmEs253S8MzOc8Arsq/IQFX2s4DNqatixDJacZY6m27W4K424=
=MiRZ
-----END PGP SIGNATURE-----

--7eebgi68NEWUnr0qnwcAQKeBn2ZnM0aEi--
