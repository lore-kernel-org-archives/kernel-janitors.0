From: Firo Yang <firogm@gmail.com>
Date: Tue, 09 Jun 2015 08:25:01 +0000
Subject: Re: [PATCH v2] perf tools: Add error handling
Message-Id: <20150609082501.GA22693@firo>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433836196-20647-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1433836196-20647-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jun 09, 2015 at 10:05:24AM +0200, Julia Lawall wrote:
>On Tue, 9 Jun 2015, Firo Yang wrote:
>
>> Add error handling code for snprintf and rename in check_backup.
>>
>> Signed-off-by: Firo Yang <firogm@gmail.com>
>> ---
>> Since there is  no suitable error code snprintf, I just return the
>> value returned by snprintf.
>>
>>  tools/perf/util/data.c | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/perf/util/data.c b/tools/perf/util/data.c
>> index 1921942..26ab45a 100644
>> --- a/tools/perf/util/data.c
>> +++ b/tools/perf/util/data.c
>> @@ -32,15 +32,26 @@ static bool check_pipe(struct perf_data_file *file)
>>
>>  static int check_backup(struct perf_data_file *file)
>>  {
>> +	int ret;
>>  	struct stat st;
>>
>>  	if (!stat(file->path, &st) && st.st_size) {
>> -		/* TODO check errors properly */
>>  		char oldname[PATH_MAX];
>> -		snprintf(oldname, sizeof(oldname), "%s.old",
>> +		ret = snprintf(oldname, sizeof(oldname), "%s.old",
>>  			 file->path);
>> +		if (ret < 0) {
>
>Can it ever return a negative value anyway?  It seems clear that it can
I misunderstand the content in man 3 snprintf:
        If an output error is encountered, a negative value is returned.

It should be nothing related to snprintf.

>return a positive value.  That value might not be an appropriate result
>for this function.
>
>julia
>
>> +			pr_err("failed to make name %s.old\n", file->path);
>> +			return ret;
>> +		}
>> +
>>  		unlink(oldname);
>> -		rename(file->path, oldname);
>> +
>> +		ret = rename(file->path, oldname);
>> +		if (ret < 0) {
>> +			pr_err("failed to rename %s to %s\n", file->path,
>> +				oldname);
>> +			return -errno;
>
>What is
If rename failed, it would set the errno to the corresponding error
number. You can find it in other function in the same file.
>
>> +		}
>>  	}
>>
>>  	return 0;
>> --
>> 2.4.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

-- 
