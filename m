From: Andy Lutomirski <luto@amacapital.net>
Date: Sun, 01 Apr 2012 16:49:05 +0000
Subject: Re: Disregard my patch: x86, vsyscall: Fix sparse warning: Using plain integer as NULL
Message-Id: <CALCETrWKXYjBaahh-wEscy16AB5YdFd8i83Sy96Xd9UXxdn_-A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1333289891.2531.5.camel@debian>
In-Reply-To: <1333289891.2531.5.camel@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Apr 1, 2012 at 7:18 AM, Emil Goode <emilgoode@gmail.com> wrote:
> Please disregard my previous patch.
> I missed the comment saying "0 is a valid user pointer".

The comment could be changed to "NULL", though.

--Andy

>
> Best regards,
> Emil Goode
>
> On Sun, 2012-04-01 at 01:59 +0200, Emil Goode wrote:
>> This patch silences the following sparse warning:
>> arch/x86/kernel/vsyscall_64.c:250:34:
>> =A0 =A0 =A0 =A0warning: Using plain integer as NULL pointer
>>
>> Signed-off-by: Emil Goode <emilgoode@gmail.com>
>> ---
>> =A0arch/x86/kernel/vsyscall_64.c | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/x86/kernel/vsyscall_64.c b/arch/x86/kernel/vsyscall_64=
.c
>> index f386dc4..6170ff9 100644
>> --- a/arch/x86/kernel/vsyscall_64.c
>> +++ b/arch/x86/kernel/vsyscall_64.c
>> @@ -247,7 +247,7 @@ bool emulate_vsyscall(struct pt_regs *regs, unsigned=
 long address)
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D sys_getcpu((unsigned __user *)regs->=
di,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(unsigned=
 __user *)regs->si,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NULL);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> =A0 =A0 =A0 }
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
