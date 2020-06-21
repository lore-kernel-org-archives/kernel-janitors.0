From: Nirmoy <nirmodas@amd.com>
Date: Sun, 21 Jun 2020 21:38:39 +0000
Subject: Re: [PATCH][next] drm/mm/selftests: fix unsigned comparison with less than zero
Message-Id: <21094d57-c64e-ea7e-426e-997cd45d4635@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200617155959.231740-1-colin.king@canonical.com>
 <20200618103956.GQ4151@kadam>
In-Reply-To: <20200618103956.GQ4151@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>


On 6/18/20 12:39 PM, Dan Carpenter wrote:
> On Wed, Jun 17, 2020 at 04:59:59PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Function get_insert_time can return error values that are cast
>> to a u64. The checks of insert_time1 and insert_time2 check for
>> the errors but because they are u64 variables the check for less
>> than zero can never be true. Fix this by casting the value to s64
>> to allow of the negative error check to succeed.
>>
>> Addresses-Coverity: ("Unsigned compared against 0, no effect")
>> Fixes: 6e60d5ded06b ("drm/mm: add ig_frag selftest")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/gpu/drm/selftests/test-drm_mm.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
>> index 3846b0f5bae3..671a152a6df2 100644
>> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
>> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
>> @@ -1124,12 +1124,12 @@ static int igt_frag(void *ignored)
>>   
>>   		insert_time1 = get_insert_time(&mm, insert_size,
>>   					       nodes + insert_size, mode);
>> -		if (insert_time1 < 0)
>> +		if ((s64)insert_time1 < 0)
>>   			goto err;
> The error codes in this function seem pretty messed up.
>
> Speaking of error codes, what the heck is going on with
> prepare_igt_frag().


This is on me. I will send a patch to correct this mistake.


Thanks,

Nirmoy


>
>    1037  static int prepare_igt_frag(struct drm_mm *mm,
>    1038                              struct drm_mm_node *nodes,
>    1039                              unsigned int num_insert,
>    1040                              const struct insert_mode *mode)
>    1041  {
>    1042          unsigned int size = 4096;
>    1043          unsigned int i;
>    1044          u64 ret = -EINVAL;
>                  ^^^^^^^^^^^^^^^^^^
> Why is it u64?
>
>    1045
>    1046          for (i = 0; i < num_insert; i++) {
>    1047                  if (!expect_insert(mm, &nodes[i], size, 0, i,
>    1048                                     mode) != 0) {
>    1049                          pr_err("%s insert failed\n", mode->name);
>    1050                          goto out;
>                                  ^^^^^^^^
> One of the common bugs with do nothing gotos is that we forget to set
> the error code.  If we did a direct "return -EINVAL;" here, then there
> would be no ambiguity.
>
>    1051                  }
>    1052          }
>    1053
>    1054          /* introduce fragmentation by freeing every other node */
>    1055          for (i = 0; i < num_insert; i++) {
>    1056                  if (i % 2 = 0)
>    1057                          drm_mm_remove_node(&nodes[i]);
>    1058          }
>    1059
>    1060  out:
>    1061          return ret;
>    1062
>    1063  }
>
> regards,
> dan carpenter
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data%7C01%7Cnirmoy.das%40amd.com%7C74bcb0163ea04eaf0ca008d8137403ac%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637280736306420244&amp;sdata=kZ7BUVaFWI5aV4OztJr8GMS8QWjz%2F7JIb9jwRM3ct5g%3D&amp;reserved=0
