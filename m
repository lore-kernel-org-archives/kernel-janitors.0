From: Steve French <smfrench@gmail.com>
Date: Tue, 31 Jan 2012 13:43:10 +0000
Subject: Re: [patch] cifs: check offset in decode_ntlmssp_challenge()
Message-Id: <CAH2r5ms5mt9=pzOhKKpJ16wqnu_A-aRy2oJm4HVCrwUH1aBfvA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120131085201.GB22039@elgon.mountain>
In-Reply-To: <20120131085201.GB22039@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org

merged to cifs-2.6.git

On Tue, Jan 31, 2012 at 2:52 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
>
> We should check that we're not copying memory from beyond the end of the
> blob.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
> index d85efad..eb76741 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -395,6 +395,10 @@ static int decode_ntlmssp_challenge(char *bcc_ptr, i=
nt blob_len,
> =A0 =A0 =A0 =A0ses->ntlmssp->server_flags =3D le32_to_cpu(pblob->Negotiat=
eFlags);
> =A0 =A0 =A0 =A0tioffset =3D le32_to_cpu(pblob->TargetInfoArray.BufferOffs=
et);
> =A0 =A0 =A0 =A0tilen =3D le16_to_cpu(pblob->TargetInfoArray.Length);
> + =A0 =A0 =A0 if (tioffset > blob_len || tioffset + tilen > blob_len) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cERROR(1, "tioffset + tilen too high %u + %=
u", tioffset, tilen);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0if (tilen) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ses->auth_key.response =3D kmalloc(tilen, =
GFP_KERNEL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ses->auth_key.response) {




--
Thanks,

Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
