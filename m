From: Jeff Layton <jlayton@redhat.com>
Date: Tue, 31 Jan 2012 10:49:37 +0000
Subject: Re: [patch] cifs: check offset in decode_ntlmssp_challenge()
Message-Id: <20120131054937.3e7ccf89@tlielax.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120131085201.GB22039@elgon.mountain>
In-Reply-To: <20120131085201.GB22039@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org

On Tue, 31 Jan 2012 11:52:01 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We should check that we're not copying memory from beyond the end of the
> blob.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
> index d85efad..eb76741 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -395,6 +395,10 @@ static int decode_ntlmssp_challenge(char *bcc_ptr, int blob_len,
>  	ses->ntlmssp->server_flags = le32_to_cpu(pblob->NegotiateFlags);
>  	tioffset = le32_to_cpu(pblob->TargetInfoArray.BufferOffset);
>  	tilen = le16_to_cpu(pblob->TargetInfoArray.Length);
> +	if (tioffset > blob_len || tioffset + tilen > blob_len) {
> +		cERROR(1, "tioffset + tilen too high %u + %u", tioffset, tilen);
> +		return -EINVAL;
> +	}

Good catch.

Do we really need a || here though? Would it not be sufficient to check
if tioffset + tilen > blob_len? Or are you concerned about that value
wrapping?

>  	if (tilen) {
>  		ses->auth_key.response = kmalloc(tilen, GFP_KERNEL);
>  		if (!ses->auth_key.response) {
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Jeff Layton <jlayton@redhat.com>
