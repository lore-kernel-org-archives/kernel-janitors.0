From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 02 Jul 2019 22:42:31 +0000
Subject: Re: [PATCH][next] selftests/x86: fix spelling mistake "FAILT" -> "FAIL"
Message-Id: <0031e09b-e309-3976-09b1-dc8d10365aee@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190701130431.13391-1-colin.king@canonical.com>
 <CALCETrVo0rJVxsYvo=abDfFCZHBuCiB0coSBXoDeP_emSZgESg@mail.gmail.com>
 <6e5a9bed-4f7f-4851-0421-2b440ff1f584@kernel.org>
 <9ba791d5-0d67-9834-90e9-e1dca307d386@kernel.org>
In-Reply-To: <9ba791d5-0d67-9834-90e9-e1dca307d386@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: shuah <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 02/07/2019 20:25, shuah wrote:
> On 7/2/19 8:22 AM, shuah wrote:
>> On 7/1/19 11:48 AM, Andy Lutomirski wrote:
>>> On Mon, Jul 1, 2019 at 6:04 AM Colin King <colin.king@canonical.com>
>>> wrote:
>>>>
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> There is an spelling mistake in an a test error message. Fix it.
>>>>
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>   tools/testing/selftests/x86/test_vsyscall.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/testing/selftests/x86/test_vsyscall.c
>>>> b/tools/testing/selftests/x86/test_vsyscall.c
>>>> index 4602326b8f5b..a4f4d4cf22c3 100644
>>>> --- a/tools/testing/selftests/x86/test_vsyscall.c
>>>> +++ b/tools/testing/selftests/x86/test_vsyscall.c
>>>> @@ -451,7 +451,7 @@ static int test_vsys_x(void)
>>>>                  printf("[OK]\tExecuting the vsyscall page failed:
>>>> #PF(0x%lx)\n",
>>>>                         segv_err);
>>>>          } else {
>>>> -               printf("[FAILT]\tExecution failed with the wrong
>>>> error: #PF(0x%lx)\n",
>>>> +               printf("[FAIL]\tExecution failed with the wrong
>>>> error: #PF(0x%lx)\n",
>>>>                         segv_err);
>>>>                  return 1;
>>>>          }
>>>> -- 
>>>> 2.20.1
>>>>
>>>
>>> Acked-by: Andy Lutomirski <luto@kernel.org>
>>>
>>
>> Thanks Andy!
>>
>> I will queue this up for 5.3
>>
>> -- Shuah
>>
> 
> Hi Colin,
> 
> Checkpatch warning on this. Probably failed on the original patch.
> Could you please fix the checkpatch warn, and send v2.

If I split the line, I get another checkpatch warning:

"WARNING: quoted string split across lines"

Either way checkpatch emits a warning. The convention is to not break
literal strings, and the line is only a few chars over the 80 char
boundary, so the V1 of the patch is the way it should be IMHO.

Colin


> 
> thanks,
> -- Shuah
