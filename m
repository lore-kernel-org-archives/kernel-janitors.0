From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 02 Oct 2020 13:20:29 +0000
Subject: Re: [PATCH] selftests/ftrace: check for do_sys_openat2 in user-memory test
Message-Id: <985cc843-a8d1-9fe2-b663-f3db8edbf848@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201001085641.51130-1-colin.king@canonical.com>
 <20201002220756.b62653d1e6aba102521054d2@kernel.org>
In-Reply-To: <20201002220756.b62653d1e6aba102521054d2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, Tom Zanussi <zanussi@kernel.org>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/10/2020 14:07, Masami Hiramatsu wrote:
> On Thu,  1 Oct 2020 09:56:41 +0100
> Colin King <colin.king@canonical.com> wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> More recent libc implementations are now using openat/openat2 system
>> calls so also add do_sys_openat2 to the tracing so that the test
>> passes on these systems because do_sys_open may not be called.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  .../testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc  | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc
>> index a30a9c07290d..cf1b4c3e9e6b 100644
>> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc
>> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_args_user.tc
>> @@ -9,6 +9,8 @@ grep -A10 "fetcharg:" README | grep -q '\[u\]<offset>' || exit_unsupported
>>  :;: "user-memory access syntax and ustring working on user memory";:
>>  echo 'p:myevent do_sys_open path=+0($arg2):ustring path2=+u0($arg2):string' \
>>  	> kprobe_events
> 
> OK, at first, you need to check the kernel has do_sys_openat2 from
> /proc/kallsyms (grep -qw will help you), because it is new syscall.
> 
>> +echo 'p:myevent2 do_sys_openat2 path=+0($arg2):ustring path2=+u0($arg2):string' \
>> +	> kprobe_events
> 
> Also, you need to append (">>") it instead overwrite (">") to kprobe_events.
> 
>>  
>>  grep myevent kprobe_events | \
>>  	grep -q 'path=+0($arg2):ustring path2=+u0($arg2):string'
> 
> And also you have to enable both myevent and myevent2 (if exists) after
> this.
> 
> Then I think your patch will work correctly.

Indeed, thanks. I'll send a V2 shortly.

> 
> Thank you!
> 
