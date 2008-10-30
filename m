From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Thu, 30 Oct 2008 13:45:55 +0000
Subject: Re: [PATCH] : Fix compilation warnings in net/netlabel/netlabel_addrlist.c
Message-Id: <ea11fea30810300633m5a99d4a1k9c0b9a2aa241ecb1@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30810290106u3f92268q62226da65db6f6a4@mail.gmail.com>
	 <200810291543.49225.paul.moore@hp.com>
	 <ea11fea30810291910v1f99b62arcc63285fefe8bf72@mail.gmail.com>
	 <200810300812.39810.paul.moore@hp.com>
In-Reply-To: <200810300812.39810.paul.moore@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Moore <paul.moore@hp.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 30, 2008 at 5:42 PM, Paul Moore <paul.moore@hp.com> wrote:
> On Wednesday 29 October 2008 10:10:36 pm Manish Katiyar wrote:
>> On Thu, Oct 30, 2008 at 1:13 AM, Paul Moore <paul.moore@hp.com> wrote:
>> > On Wednesday 29 October 2008 2:27:44 pm you wrote:
>> >> Hi Paul,
>> >>
>> >> Does this look better ?? Appreciate your help. Patch compile
>> >> tested.
>> >>
>> >> Enable netlabel auditing functions only when CONFIG_AUDIT is set
>> >>
>> >> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
>> >
>> > Much better, just some style nits noted below that need to be
>> > addressed ...
>>
>> Hi Paul,
>>
>> Updated patch below as per your comments.
>>
>> Enable netlabel auditing functions only when CONFIG_AUDIT is set
>>
>> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
>
> Thanks for sticking with this, I appreciate it.  There is still one
> small style nit (see below) but it is really my fault for not being
> more specific.  Unless you object I'll go ahead and fix it up when I
> apply the patch.
>
> I'll send a git pull request out to netdev later today, including your
> patch, as there are two other labeled networking patches that need to
> make the next 2.6.28-rcX release.
>
>> ---
>>  net/netlabel/netlabel_addrlist.c |    2 ++
>>  net/netlabel/netlabel_addrlist.h |   22 ++++++++++++++++++++++
>>  2 files changed, 24 insertions(+), 0 deletions(-)
>>
>> diff --git a/net/netlabel/netlabel_addrlist.c
>> b/net/netlabel/netlabel_addrlist.c index b0925a3..3fe73c2 100644
>> --- a/net/netlabel/netlabel_addrlist.c
>> +++ b/net/netlabel/netlabel_addrlist.c
>> @@ -327,6 +327,7 @@ struct netlbl_af6list
>> *netlbl_af6list_remove(const struct in6_addr *addr,
>>   * Write the IPv4 address and address mask, if necessary, to
>> @audit_buf. *
>>   */
>> +#ifdef CONFIG_AUDIT
>>  void netlbl_af4list_audit_addr(struct audit_buffer *audit_buf,
>>                                         int src, const char *dev,
>>                                         __be32 addr, __be32 mask)
>
> When I said to move the #ifdef below the comment, I meant below
> the "Audit Helper Functions" comment but before the function's kdoc
> comment header.

Hi Paul,

Below is the updated patch.

Enable netlabel auditing functions only when CONFIG_AUDIT is set

Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 net/netlabel/netlabel_addrlist.c |    2 ++
 net/netlabel/netlabel_addrlist.h |   22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/net/netlabel/netlabel_addrlist.c b/net/netlabel/netlabel_addrlist.c
index b0925a3..249f6b9 100644
--- a/net/netlabel/netlabel_addrlist.c
+++ b/net/netlabel/netlabel_addrlist.c
@@ -315,6 +315,7 @@ struct netlbl_af6list *netlbl_af6list_remove(const
struct in6_addr *addr,
  * Audit Helper Functions
  */

+#ifdef CONFIG_AUDIT
 /**
  * netlbl_af4list_audit_addr - Audit an IPv4 address
  * @audit_buf: audit buffer
@@ -386,3 +387,4 @@ void netlbl_af6list_audit_addr(struct audit_buffer
*audit_buf,
 	}
 }
 #endif /* IPv6 */
+#endif /* CONFIG_AUDIT */
diff --git a/net/netlabel/netlabel_addrlist.h b/net/netlabel/netlabel_addrlist.h
index 0242bea..3212965 100644
--- a/net/netlabel/netlabel_addrlist.h
+++ b/net/netlabel/netlabel_addrlist.h
@@ -120,9 +120,19 @@ struct netlbl_af4list *netlbl_af4list_search(__be32 addr,
 struct netlbl_af4list *netlbl_af4list_search_exact(__be32 addr,
 						   __be32 mask,
 						   struct list_head *head);
+
+#ifdef CONFIG_AUDIT
 void netlbl_af4list_audit_addr(struct audit_buffer *audit_buf,
 			       int src, const char *dev,
 			       __be32 addr, __be32 mask);
+#else
+static inline void netlbl_af4list_audit_addr(struct audit_buffer *audit_buf,
+			       int src, const char *dev,
+			       __be32 addr, __be32 mask)
+{
+	return;
+}
+#endif

 #if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)

@@ -179,11 +189,23 @@ struct netlbl_af6list
*netlbl_af6list_search(const struct in6_addr *addr,
 struct netlbl_af6list *netlbl_af6list_search_exact(const struct in6_addr *addr,
 						   const struct in6_addr *mask,
 						   struct list_head *head);
+
+#ifdef CONFIG_AUDIT
 void netlbl_af6list_audit_addr(struct audit_buffer *audit_buf,
 			       int src,
 			       const char *dev,
 			       const struct in6_addr *addr,
 			       const struct in6_addr *mask);
+#else
+static inline void netlbl_af6list_audit_addr(struct audit_buffer *audit_buf,
+			       int src,
+			       const char *dev,
+			       const struct in6_addr *addr,
+			       const struct in6_addr *mask)
+{
+	return;
+}
+#endif
 #endif /* IPV6 */

 #endif
-- 
1.5.4.3


Thanks -
Manish

>
> --
> paul moore
> linux @ hp
>
