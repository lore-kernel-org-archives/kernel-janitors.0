From: Marcos Souza <marcos.mage@gmail.com>
Date: Fri, 04 Nov 2011 11:34:40 +0000
Subject: Re: [PATCH 3/4] drivers/staging/vt6656/iocmd.h: Removed ttype.h and
Message-Id: <CAGkUK2srcFjxVjw7aKHU-J=yUoZcg6AZHf0n4eNHGA0T5addng@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAGkUK2tYVKSawyp47bs2d8U1D=EKzBk216RLP-OC5P0e=VcNjw@mail.gmail.com>
In-Reply-To: <CAGkUK2tYVKSawyp47bs2d8U1D=EKzBk216RLP-OC5P0e=VcNjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

2011/11/4, Dan Carpenter <dan.carpenter@oracle.com>:
> This patch was mangled by your mail client.  Read
> Documentation/email-clients.txt, send the patch to yourself.  Verify
> that it applies and then resend.
Strange, because I sent this with the git send-email...
>
> On Fri, Nov 04, 2011 at 07:10:56AM -0300, Marcos Souza wrote:
>> I forgot to sent these patches, so I'm sending now
>>
>> Removed comments about functions/veriables static and stuff like these.
>                                    variables
> Normally, we don't comment too much on changelog spelling but since
> you're going to resend this anyway, could you fix the typo there?
Of course I can.
>
>
>
>> @@ -123,18 +115,16 @@ typedef struct tagSCmdBSSJoin {
>>      u16     wBBPType;
>>      u8	    ssid[SSID_MAXLEN + 2];
>>      u32	    uChannel;
>> -    BOOL    bPSEnable;
>> -    BOOL    bShareKeyAuth;
>> +    int    bPSEnable;
>> +    int    bShareKeyAuth;
>
> These should be bool.  Obviously in the original code, BOOL was
> defined as int and changing it has the potential to break things so
> it needs care.  You would need to look at all the places where
> bPSEnable is used and verify that it works for type "bool".  Use grep
> or cscope.  If you don't feel comfortable doing that, then I would
> leave it as is for now.
>
>> - BOOL       bWrite;
>> + int       bWrite;
>
> Same thing for all the other places as well.
The BOOL type was definied in the ttype.h too, so for the reason of
the TODO, I must remove this header... But I believe that BOOL has a
typedef in the headers of linux... I will check it.
>
> Some people might complain that this patch does too many things in
> a single patch.  Maybe break out the white space changes from the
> other changes.
I think this too, but is so "ugly" fix a TODO file, without make this
"small" changes iof coding standards... I will try to do it =3DD
> regards,
> dan carpenter
>
Again, thanks for the comments!

--=20
Marcos Paulo de Souza

*Porque uma vida sem desafios =E9 uma vida sem raz=E3o.*
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
