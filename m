From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 08:22:26 +0000
Subject: Re: [PATCH] selftests/net: skip msg_zerocopy test if we have less than 4 CPUs
Message-Id: <fc66cf3c-b4be-f098-3a2b-aef36b90835d@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804123012.378750-1-colin.king@canonical.com>
 <b99004ea-cd9d-bec3-5f9f-82dcb00a6284@gmail.com>
 <CA+FuTSd9K+s1rXUFpb_RWEC-uAgwU1Vz44zaUPaZK0cfsX4kwA@mail.gmail.com>
In-Reply-To: <CA+FuTSd9K+s1rXUFpb_RWEC-uAgwU1Vz44zaUPaZK0cfsX4kwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Shuah Khan <shuah@kernel.org>, Network Development <netdev@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On 05/08/2020 09:06, Willem de Bruijn wrote:
> On Wed, Aug 5, 2020 at 2:54 AM Eric Dumazet <eric.dumazet@gmail.com> wrote:
>>
>>
>>
>> On 8/4/20 5:30 AM, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The current test will exit with a failure if it cannot set affinity on
>>> specific CPUs which is problematic when running this on single CPU
>>> systems. Add a check for the number of CPUs and skip the test if
>>> the CPU requirement is not met.
>>>
>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>> ---
>>>  tools/testing/selftests/net/msg_zerocopy.sh | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/tools/testing/selftests/net/msg_zerocopy.sh b/tools/testing/selftests/net/msg_zerocopy.sh
>>> index 825ffec85cea..97bc527e1297 100755
>>> --- a/tools/testing/selftests/net/msg_zerocopy.sh
>>> +++ b/tools/testing/selftests/net/msg_zerocopy.sh
>>> @@ -21,6 +21,11 @@ readonly DADDR6='fd::2'
>>>
>>>  readonly path_sysctl_mem="net.core.optmem_max"
>>>
>>> +if [[ $(nproc) -lt 4 ]]; then
>>> +     echo "SKIP: test requires at least 4 CPUs"
>>> +     exit 4
>>> +fi
>>> +
>>>  # No arguments: automated test
>>>  if [[ "$#" -eq "0" ]]; then
>>>       $0 4 tcp -t 1
>>>
>>
>> Test explicitly uses CPU 2 and 3, right ?
>>
>> nproc could be 500, yet cpu 2 or 3 could be offline
>>
>> # cat /sys/devices/system/cpu/cpu3/online
>> 0
>> # echo $(nproc)
>> 71
> 
> The cpu affinity is only set to bring some stability across runs.
> 
> The test does not actually verify that a run with zerocopy is some
> factor faster than without, as that factor is hard to choose across
> all platforms. As a result the automated run mainly gives code coverage.
> 
> It's preferable to always run. And on sched_setaffinity failure log a
> message about possible jitter and continue. I can send that patch, if
> the approach sounds good.
> 
That's sounds preferable to my bad fix for sure :-)

Colin
