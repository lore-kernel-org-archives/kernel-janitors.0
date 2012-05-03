From: Tomas Melin <tomas.melin@iki.fi>
Date: Thu, 03 May 2012 13:55:19 +0000
Subject: Re: [PATCH] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <CACraW2pi94heTXMwq2n52WUpF+CP-28--oZMVdAG_53GMeEXGA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
In-Reply-To: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, May 2, 2012 at 11:06 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> Please break this up into one-change-per-patch, so it can be reviewed
> easier and accepted properly.

Ok, got it. I'll get back to you with a patch-series.

> Dan Carpenter <dan.carpenter@oracle.com> writes:
>> When I review this stuff I have a script called rename_rev.pl
>> (attached) and I `cat your_patch.txt | rename_rev.pl`.  It removes
>> the indenting changes and only shows the logic changes.  So the
>> solid block of changes becomes a two liner which takes 10 seconds
>> to review.  The other changes to line breaks and comments and curly
>> parens are much simpler to review on their own.  10 seconds for
>> each.  It's way way easier to review one liner changes than a
>> tangled block of changes.

Nice script, thanks.

Tomas




On Thu, May 3, 2012 at 11:40 AM, Nikola Pajkovsky <n.pajkovsky@gmail.com> w=
rote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
>
>> On Wed, May 02, 2012 at 07:13:37PM +0300, Tomas Melin wrote:
>>> -Simplified function logic by assuming that n_chan >1 if not <=3D1. Rem=
oves
>>> one level of indentation.
>>> -> readability improved and code fits into 80 chars
>>> - Code indentation fixes, corrected comments
>>> - Added braces to if() for readability
>>>
>>
>> Greg of course is the Boss-man and he already explained that this
>> needed to get broken up, but yeah I also wanted to say that as well.
>> The first patch should just pull the if (n_chan =3D 1) forward,
>> remove the else clause, and pull the indent level in.
>>
>> When I review this stuff I have a script called rename_rev.pl
>> (attached) and I `cat your_patch.txt | rename_rev.pl`. =A0It removes
>> the indenting changes and only shows the logic changes. =A0So the
>> solid block of changes becomes a two liner which takes 10 seconds
>> to review. =A0The other changes to line breaks and comments and curly
>> parens are much simpler to review on their own. =A010 seconds for
>> each. =A0It's way way easier to review one liner changes than a
>> tangled block of changes.
>
> And I have to thank you for the script. thanks.
>
> --
> Nikola
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
