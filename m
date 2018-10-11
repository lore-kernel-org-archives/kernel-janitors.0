From: Eric Dumazet <edumazet@google.com>
Date: Thu, 11 Oct 2018 15:10:35 +0000
Subject: Re: [bug report] tcp: add TCP_ZEROCOPY_RECEIVE support for zerocopy receive
Message-Id: <CANn89iLqOM=jT4E1rtDKt+iGkwSy889P4rhSM+epM_Bunnze-g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181011122852.GA23625@mwanda>
In-Reply-To: <20181011122852.GA23625@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 11, 2018 at 5:29 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hi Eric,
>
> The patch 05255b823a61: "tcp: add TCP_ZEROCOPY_RECEIVE support for
> zerocopy receive" from Apr 27, 2018, leads to the following static
> checker warning:
>
>         net/ipv4/tcp.c:1796 tcp_zerocopy_receive()
>         error: uninitialized symbol 'offset'.
>
> net/ipv4/tcp.c
>   1760                  return -EINVAL;
>   1761
>   1762          if (sk->sk_state = TCP_LISTEN)
>   1763                  return -ENOTCONN;
>   1764
>   1765          sock_rps_record_flow(sk);
>   1766
>   1767          down_read(&current->mm->mmap_sem);
>   1768
>   1769          ret = -EINVAL;
>   1770          vma = find_vma(current->mm, address);
>   1771          if (!vma || vma->vm_start > address || vma->vm_ops != &tcp_vm_ops)
>   1772                  goto out;
>   1773          zc->length = min_t(unsigned long, zc->length, vma->vm_end - address);
>   1774
>   1775          tp = tcp_sk(sk);
>   1776          seq = tp->copied_seq;
>   1777          inq = tcp_inq(sk);
>   1778          zc->length = min_t(u32, zc->length, inq);
>   1779          zc->length &= ~(PAGE_SIZE - 1);
>   1780          if (zc->length) {
>   1781                  zap_page_range(vma, address, zc->length);
>   1782                  zc->recv_skip_hint = 0;
>   1783          } else {
>   1784                  zc->recv_skip_hint = inq;
>   1785          }
>   1786          ret = 0;
>   1787          while (length + PAGE_SIZE <= zc->length) {
>   1788                  if (zc->recv_skip_hint < PAGE_SIZE) {
>   1789                          if (skb) {
>   1790                                  skb = skb->next;
>   1791                                  offset = seq - TCP_SKB_CB(skb)->seq;
>   1792                          } else {
>   1793                                  skb = tcp_recv_skb(sk, seq, &offset);
>                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   1794                          }
>   1795
>   1796                          zc->recv_skip_hint = skb->len - offset;
>                                                      ^^^^^^^^
> How do we know that tcp_recv_skb() doesn't return NULL?

Hi Dan

Look at tcp_inq(sk)

If tcp_recv_skb() returns NULL here, then it would mean a serious bug
in TCP stack,
deserving a crash for further analysis.

We do not add NULL pointers checks only for static analysers :)

Thanks.


>
>   1797                          offset -= skb_headlen(skb);
>   1798                          if ((int)offset < 0 || skb_has_frag_list(skb))
>   1799                                  break;
>
> regards,
> dan carpenter
