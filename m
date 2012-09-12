From: Marcos Souza <marcos.souza.org@gmail.com>
Date: Wed, 12 Sep 2012 16:10:50 +0000
Subject: Re: [PATCH v2 7/8] drivers/media/platform/davinci/vpbe.c: Removes useless kfree()
Message-Id: <CAH0vN5KeNB1JfW8n66fse=vuk-ak9LShni7FhVCJ=_kjyEzqcg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347454564-5178-2-git-send-email-peter.senna@gmail.com>
	<CAH0vN5+ZoexHtmgyZ+s9tiW3LYx+6PMT8aLyYt-T5mnaGXvYbQ@mail.gmail.com>
	<CA+MoWDquDi6+kY9z3rj79dJK6j5tSWO9oWHCkvt6J-XBB=HNvA@mail.gmail.com>
In-Reply-To: <CA+MoWDquDi6+kY9z3rj79dJK6j5tSWO9oWHCkvt6J-XBB=HNvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Peter,

2012/9/12 Peter Senna Tschudin <peter.senna@gmail.com>:
> Marcos,
>
>> Now that you removed this kfree, you could remove this label too. Very
>> nice your cleanup :)
> Thanks!
>
>>
>>>  vpbe_fail_sd_register:
>>>         kfree(vpbe_dev->encoders);
>>>  vpbe_fail_v4l2_device:
>
> The problem removing the label is that it will require some more work
> naming the labels. See:
> if (!vpbe_dev->amp) {
> ...
>         goto vpbe_fail_amp_register;
>
> If I just remove the label vpbe_fail_amp_register, the label names
> will not make sense any more as the next label is
> vpbe_fail_sd_register. So I will need to change the name to something
> different or rename all labels to out1, out2, out3 or err1, err2,
> err3, or ....

I was looking at the code here, but this code is under
drivers/media/video/davince/vpbe.c....

Are  you using the Linus tree?

BTW, this label is only used once. AFAICS, you can GOTO to the next
label, vpbe_fail_sd_register in this case, who frees another member of
the vpbe_dev.

This make sense to you?

> Any suggestions?
>
> --
> Peter



--=20
Att,

Marcos Paulo de Souza
Acad=EAmico de Ciencia da Computa=E7=E3o - FURB - SC
"Uma vida sem desafios =E9 uma vida sem raz=E3o"
"A life without challenges, is a non reason life"
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
