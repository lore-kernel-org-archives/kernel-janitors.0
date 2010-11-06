From: Facundo Gaich <facugaich@gmail.com>
Date: Sat, 06 Nov 2010 08:36:17 +0000
Subject: Re: Cc: [PATCH] Staging: solo6x10: Fix checkpatch errors and most warnings
Message-Id: <AANLkTimme3gh2nv+4XhcSZG6gqRB_W0Ph7bYWJwgdsBm@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTikQ_a4bS6aNOfEJMgF3w_17S8RBrWx7HbpqhK0K@mail.gmail.com>
In-Reply-To: <AANLkTikQ_a4bS6aNOfEJMgF3w_17S8RBrWx7HbpqhK0K@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for your reply, the truth is the original message was sent with
"git send-mail" while on the other hand I fwd'ed this to the janitors
ML with the Gmail webclient, that's probably what mangled it. So I'm
guessing the former was sent correctly? I did Cc Ben Collins and he
replied with an "Acked-By:".

Sincerely,
Facundo

On Sat, Nov 6, 2010 at 1:05 AM, Dan Carpenter <error27@gmail.com> wrote:
> On Fri, Nov 05, 2010 at 08:08:35PM -0300, Facundo Gaich wrote:
>> (Forgot to Cc this list in the original email. By the way, I sent this
>> to greg@kroah instead of greg@suse, because that's what the TODO file
>> said. I hope that's still ok?)
>>
>> This patch fixes all errors and most warnings reported by
>> checkpatch.pl for all the files in the driver.
>
> Hi Facundo,
>
> Your email client is mangling this patch. =A0It's wrapping the lines and
> changing the spaces to tabs.
>
> Please read Documentation/email-clients.txt. =A0Then send an email to
> yourself and verify that the patch applies. =A0(Save it as a raw email.
> cat raw_email.txt | patch -p1 -R). =A0Then resend and we can review it.
>
> I didn't see the original email, but don't forget to CC Ben Collins as
> well. =A0His email is <bcollins@bluecherry.net>. =A0And CC the staging li=
st
> too <devel@driverdev.osuosl.org>.
>
> regards,
> dan carpenter
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
