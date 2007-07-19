From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 19 Jul 2007 17:06:21 +0000
Subject: Re: netdev_priv()
Message-Id: <87k5swz5ki.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Thomas Surrel" <thomas.surrel@gmail.com> writes:

>> You mean that the name of the variable change ? But
>> my semantic path, or more precisly the transformation tool
>> handles that (unless my_own_private_netdevice has not
>> the struct net_device*  type in which case you are right).
>> I have written 'dev' in the semantic patch but it's a "metavariable".
>
> Ok, I didn't know.

There is a kind of tutorial on our tool if you are interested at OLS
this year. It's available here
http://www.emn.fr/x-info/coccinelle/ols07-padioleau.pdf

>
>> I think I have found why I was too restrictive. Some people
>> use alloc_etherdev which calls alloc_netdev. So I just
>> have to relax the condition. There are multiple "alias"
>> to alloc_netdev.
>
> Exactly. Could you also add all the other alias to your tool ? 

You mean to the semantic patch. Yes I just need to extend the list in

@ rule1 @
type T;
struct net_device *dev;
T *x;
@@

(
 dev = alloc_netdev(sizeof(T), ...)
|
 dev = alloc_etherdev(sizeof(T))
|
 dev = alloc_netdev(sizeof(*x), ...)
|
 dev = alloc_etherdev(sizeof(*x))
|
 dev = alloc_fcdev(sizeof(T), ...)
|
 dev = alloc_fddidev(sizeof(T), ...)
)


etc





> There are:
> - alloc_fcdev
> - alloc_fddidev
> - alloc_hippi_dev
> - alloc_trdev
> - alloc_ltalkdev
> - alloc_irdadev
> - alloc_irlandev
>
> (not sure I have them all ...)

I have written a "semantic grep" to find the possible aliases. 

Here is the semantic grep (it's similar to a semantic patch)

@@
identifier fn;
identifier sizeof_priv;
@@

- fn(...,int sizeofpriv, ...) 
{
   <...
(
        alloc_netdev(sizeofpriv, ...)
|
        alloc_netdev_mq(sizeofpriv, ...)
)
   ...>    
 }



And here is what I have found:

struct net_device *alloc_fcdev(int sizeof_priv)
struct net_device *alloc_fddidev(int sizeof_priv)
struct net_device *alloc_hippi_dev(int sizeof_priv)
struct net_device *alloc_trdev(int sizeof_priv)
struct net_device *alloc_ltalkdev(int sizeof_priv)
struct net_device *alloc_etherdev_mq(int sizeof_priv, unsigned int queue_count)
struct net_device *alloc_irdadev(int sizeof_priv)

So there is also alloc_etherdev_mq.

My semantic grep didn't find alloc_irlandev because in

struct net_device *alloc_irlandev(const char *name)
{
	return alloc_netdev(sizeof(struct irlan_cb), name,
			    irlan_eth_setup);
}

the size of the private structure is not passed to alloc_irlandev.
Maybe I should extend my semantic grep but in that case I think
they are far more functions that use internally 
alloc_netdev.




>
> So to sum up, your tool is now handling everything except when the
> driver is split in multiple files

Well in that case my tool can handle it too but I just need the
user of my tool to give me the list of files that must be treated
at once. That's what I made for hostap/.
For the moment my tool has an option '-dir' to treat all
the drivers in a kernel directory, but it treats them separately.


>  (and in more tricky cases like
> airo)

Yes the semantic patch refuses to handle the files where there is a 
 dev->priv = <something>;

I could maybe extend the semantic patch to still try 
to perform some transformation even in some cases but it's
maybe complicated.

> . That's much less work then before anyway.

Yes. 

>
> A lot of drivers are doing useless casting (e.g. struct private_net
> *pn = (struct private_net *) dev->priv;). Is it something semantic
> patch can handle ?

Of course. If you look at the semantic patch I have given I already handle
some with 

@ rule2 depends on rule1 && !rule1bis  @
struct net_device *dev;
type rule1.T;
@@

- (T*) dev->priv
+ netdev_priv(dev)

So with  - (T*) I also remove the cast. 



I have started to do a more general "remove-useless-cast" semantic patch:

@@
type T;
identifier x;
void *E;
@@

T x = 
-     (T)
      E;

That removes all cast to an expression of type void*
(such as the return value of kmalloc, kzalloc, etc).
There are lots of such cases. The generated patch is quite huge.
I plan to split it and give it part by part to Andrew Morton, see
if he thinks it's something useful.



>
> Best regards,
>
> Thomas

