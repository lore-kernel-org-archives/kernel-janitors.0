From: Doug Ledford <dledford@redhat.com>
Date: Mon, 21 Mar 2016 20:15:19 +0000
Subject: Re: [patch] ib_srpt: fix a WARN_ON() message
Message-Id: <56F05657.6050608@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="G5aJQWHVP3SGx2m7msMicfQ0kXFHMKm6q"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160318054159.GE2111@mwanda> <56ECA8A0.5060502@sandisk.com>
In-Reply-To: <56ECA8A0.5060502-XdAiOPVOjttBDgjK7y7TUQ@public.gmane.org>
To: Bart Van Assche <bart.vanassche-XdAiOPVOjttBDgjK7y7TUQ@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicholas Bellinger <nab-IzHhD5pYlfBP7FQvKIMDCQ@public.gmane.org>, Sagi Grimberg <sagig-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Alex Estrin <alex.estrin-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G5aJQWHVP3SGx2m7msMicfQ0kXFHMKm6q
Content-Type: multipart/mixed; boundary="ktSfpcNudElXJL5pldW1cUDbgXIhutu4i"
From: Doug Ledford <dledford@redhat.com>
To: Bart Van Assche <bart.vanassche@sandisk.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sean Hefty <sean.hefty@intel.com>,
 Hal Rosenstock <hal.rosenstock@gmail.com>,
 Nicholas Bellinger <nab@linux-iscsi.org>, Sagi Grimberg
 <sagig@mellanox.com>, Alex Estrin <alex.estrin@intel.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-ID: <56F05657.6050608@redhat.com>
Subject: Re: [patch] ib_srpt: fix a WARN_ON() message
References: <20160318054159.GE2111@mwanda> <56ECA8A0.5060502@sandisk.com>
In-Reply-To: <56ECA8A0.5060502@sandisk.com>

--ktSfpcNudElXJL5pldW1cUDbgXIhutu4i
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/18/2016 9:17 PM, Bart Van Assche wrote:
> On 03/17/16 22:41, Dan Carpenter wrote:
>> The first argument of WARN_ON() is a condition, so it means the warnin=
g
>> message here will just be the name without the ->qp_num information.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/infiniband/ulp/srpt/ib_srpt.c
>> b/drivers/infiniband/ulp/srpt/ib_srpt.c
>> index 1d13090..0bd3cb2 100644
>> --- a/drivers/infiniband/ulp/srpt/ib_srpt.c
>> +++ b/drivers/infiniband/ulp/srpt/ib_srpt.c
>> @@ -839,7 +839,7 @@ static void srpt_zerolength_write_done(struct
>> ib_cq *cq, struct ib_wc *wc)
>>           if (srpt_set_ch_state(ch, CH_DISCONNECTED))
>>               schedule_work(&ch->release_work);
>>           else
>> -            WARN_ONCE("%s-%d\n", ch->sess_name, ch->qp->qp_num);
>> +            WARN_ONCE(1, "%s-%d\n", ch->sess_name, ch->qp->qp_num);
>>       }
>>   }
>=20
> Reviewed-by: Bart Van Assche <bart.vanassche@sandisk.com>

Thanks, applied.


--ktSfpcNudElXJL5pldW1cUDbgXIhutu4i--

--G5aJQWHVP3SGx2m7msMicfQ0kXFHMKm6q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJW8FZXAAoJELgmozMOVy/deoAQAKjOmuQ1Qk58TJ2j9iT6sNCs
zkbkysKEBFcV/QqJbeDUwxklXYlKoARkvEpRKzBF1Q5ncDKfyQ3f3Nhk0uAfCkcQ
9T1AHDlTWL/nQEfT+qQj7j8Q/DgvbTkpKzpZTSglEnf2UpxWi4EQOni3co8yDZhH
c2vYVVK+gPUOETld4pKUZf6kwjjO2mvgUXMKVr4tLS5pHoJ+rH3LIqD2P0A0PlF8
LHyuRBiSOLPsIgsSL4GTTKyzyEewSo0xDYOs01kYtLcUxnq43+C8m1OQ7S0N7yhE
lfHY2JvSHCEdGVwhz7I0M+vmZEXSf08yrKl179lzu3X2b5y/HH0c051KoRQUSXP0
b7v00ldP9C2EO9dPhsjSFcAWB80tRw7WaY4bK4R/G4vU4YNb88xj6ykcC5J0iaCc
xGdBzCmkXS06EJxNmpMMMgl/iMmvZ5gMZZWulBg/wstsa27FM9aX1MdFR7P4l+T5
UC8/lUy8gydsf/5UUgT6LGVASMhUetPBKGQkNNbzEdtBKLuT8kX6OkEUyl2zG7DC
QOyv8htfYTMhqcdyBVvUN46XyTDmd/gTg2pa2C9QrbYQltL6Rw9vUMec2f+47nkZ
RbteAcrt4Dui6ZuwuFbs8ByCZMVEa7PYjo2IEl3Yv2XdpgL2ZD7pxyvSzhiWJc/J
raJUVyCSlKUuSxOwcp0T
=hCvc
-----END PGP SIGNATURE-----

--G5aJQWHVP3SGx2m7msMicfQ0kXFHMKm6q--
