From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 17 Apr 2019 11:09:25 +0000
Subject: Re: [PATCH] perf test: fix spelling mistake "leadking" -> "leaking"
Message-Id: <49460004-94c1-ab6c-a7b7-0d65cb5f6cfb@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190417105539.5902-1-colin.king@canonical.com>
 <c9808cb2-7025-2b7a-f311-c69469fc1341@codeaurora.org>
In-Reply-To: <c9808cb2-7025-2b7a-f311-c69469fc1341@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Mukesh Ojha <mojha@codeaurora.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 17/04/2019 12:07, Mukesh Ojha wrote:
> 
> On 4/17/2019 4:25 PM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There are a couple of spelling mistakes in test assert messages. Fix
>> them.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Well, how are you shooting these mistakes one after the other?

I've got a spelling checker and I'm working down a list of 65948
potential mistakes.  I'm doing this between kernel build + debug cycles
while I'm waiting for kernels to build and tests to complete.



> 
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
> 
> Cheers,
> -Mukesh
> 
>> ---
>>   tools/perf/tests/dso-data.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/perf/tests/dso-data.c b/tools/perf/tests/dso-data.c
>> index 7f6c52021e41..946ab4b63acd 100644
>> --- a/tools/perf/tests/dso-data.c
>> +++ b/tools/perf/tests/dso-data.c
>> @@ -304,7 +304,7 @@ int test__dso_data_cache(struct test *test
>> __maybe_unused, int subtest __maybe_u
>>       /* Make sure we did not leak any file descriptor. */
>>       nr_end = open_files_cnt();
>>       pr_debug("nr start %ld, nr stop %ld\n", nr, nr_end);
>> -    TEST_ASSERT_VAL("failed leadking files", nr = nr_end);
>> +    TEST_ASSERT_VAL("failed leaking files", nr = nr_end);
>>       return 0;
>>   }
>>   @@ -380,6 +380,6 @@ int test__dso_data_reopen(struct test *test
>> __maybe_unused, int subtest __maybe_
>>       /* Make sure we did not leak any file descriptor. */
>>       nr_end = open_files_cnt();
>>       pr_debug("nr start %ld, nr stop %ld\n", nr, nr_end);
>> -    TEST_ASSERT_VAL("failed leadking files", nr = nr_end);
>> +    TEST_ASSERT_VAL("failed leaking files", nr = nr_end);
>>       return 0;
>>   }
