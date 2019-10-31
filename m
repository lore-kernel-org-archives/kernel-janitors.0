From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 31 Oct 2019 09:48:53 +0000
Subject: Re: [PATCH] vsock: Simplify '__vsock_release()'
Message-Id: <1b33ca33-a02b-1923-cbee-814e520b9700@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031064741.4567-1-christophe.jaillet@wanadoo.fr>
 <c7a0b6b0-96cd-1fd3-3d98-94a3692bda38@cogentembedded.com>
In-Reply-To: <c7a0b6b0-96cd-1fd3-3d98-94a3692bda38@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, davem@davemloft.net, sunilmut@microsoft.com, willemb@google.com, sgarzare@redhat.com, stefanha@redhat.com, ytht.net@gmail.com, arnd@arndb.de, tglx@linutronix.de, decui@microsoft.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 31/10/2019 à 10:36, Sergei Shtylyov a écrit :
> Hello!
>
> On 31.10.2019 9:47, Christophe JAILLET wrote:
>
>> Use '__skb_queue_purge()' instead of re-implementing it.
>
>    In don't see that double underscore below...
This is a typo in the commit message.

There is no need for __ because skb_dequeue was used.

Could you fix it directly in the commit message (preferred solution for 
me) or should I send a V2?

CJ

>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   net/vmw_vsock/af_vsock.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>> index 2ab43b2bba31..2983dc92ca63 100644
>> --- a/net/vmw_vsock/af_vsock.c
>> +++ b/net/vmw_vsock/af_vsock.c
> [...]
>> @@ -662,8 +661,7 @@ static void __vsock_release(struct sock *sk, int 
>> level)
>>           sock_orphan(sk);
>>           sk->sk_shutdown = SHUTDOWN_MASK;
>>   -        while ((skb = skb_dequeue(&sk->sk_receive_queue)))
>> -            kfree_skb(skb);
>> +        skb_queue_purge(&sk->sk_receive_queue);
>>             /* Clean up any sockets that never were accepted. */
>>           while ((pending = vsock_dequeue_accept(sk)) != NULL) {
>
> MBR, Sergei
>
