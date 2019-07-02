From: shuah <shuah@kernel.org>
Date: Tue, 02 Jul 2019 14:22:17 +0000
Subject: Re: [PATCH][next] selftests/x86: fix spelling mistake "FAILT" -> "FAIL"
Message-Id: <6e5a9bed-4f7f-4851-0421-2b440ff1f584@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190701130431.13391-1-colin.king@canonical.com>
 <CALCETrVo0rJVxsYvo=abDfFCZHBuCiB0coSBXoDeP_emSZgESg@mail.gmail.com>
In-Reply-To: <CALCETrVo0rJVxsYvo=abDfFCZHBuCiB0coSBXoDeP_emSZgESg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Lutomirski <luto@kernel.org>, Colin King <colin.king@canonical.com>
Cc: Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, shuah <shuah@kernel.org>

On 7/1/19 11:48 AM, Andy Lutomirski wrote:
> On Mon, Jul 1, 2019 at 6:04 AM Colin King <colin.king@canonical.com> wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is an spelling mistake in an a test error message. Fix it.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   tools/testing/selftests/x86/test_vsyscall.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/x86/test_vsyscall.c b/tools/testing/selftests/x86/test_vsyscall.c
>> index 4602326b8f5b..a4f4d4cf22c3 100644
>> --- a/tools/testing/selftests/x86/test_vsyscall.c
>> +++ b/tools/testing/selftests/x86/test_vsyscall.c
>> @@ -451,7 +451,7 @@ static int test_vsys_x(void)
>>                  printf("[OK]\tExecuting the vsyscall page failed: #PF(0x%lx)\n",
>>                         segv_err);
>>          } else {
>> -               printf("[FAILT]\tExecution failed with the wrong error: #PF(0x%lx)\n",
>> +               printf("[FAIL]\tExecution failed with the wrong error: #PF(0x%lx)\n",
>>                         segv_err);
>>                  return 1;
>>          }
>> --
>> 2.20.1
>>
> 
> Acked-by: Andy Lutomirski <luto@kernel.org>
> 

Thanks Andy!

I will queue this up for 5.3

-- Shuah
