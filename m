From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 11:51:36 +0000
Subject: re: VMCI: queue pairs implementation.
Message-Id: <20140130115136.GC12734@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130110193238.GB17997@elgon.mountain>
In-Reply-To: <20130110193238.GB17997@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello George Zhang,

The patch 06164d2b72aa: "VMCI: queue pairs implementation." from Jan
8, 2013, leads to the following static checker warning:

	drivers/misc/vmw_vmci/vmci_queue_pair.c:1800 qp_broker_alloc()
	warn: we tested 'is_local' before and it was 'false'

drivers/misc/vmw_vmci/vmci_queue_pair.c
  1763  static int qp_broker_alloc(struct vmci_handle handle,
  1764                             u32 peer,
  1765                             u32 flags,
  1766                             u32 priv_flags,
  1767                             u64 produce_size,
  1768                             u64 consume_size,
  1769                             struct vmci_qp_page_store *page_store,
  1770                             struct vmci_ctx *context,
  1771                             vmci_event_release_cb wakeup_cb,
  1772                             void *client_data,
  1773                             struct qp_broker_entry **ent,
  1774                             bool *swap)
  1775  {
  1776          const u32 context_id = vmci_ctx_get_id(context);
  1777          bool create;
  1778          struct qp_broker_entry *entry = NULL;
  1779          bool is_local = flags & VMCI_QPFLAG_LOCAL;
  1780          int result;
  1781  
  1782          if (vmci_handle_is_invalid(handle) ||
  1783              (flags & ~VMCI_QP_ALL_FLAGS) || is_local ||
                                                    ^^^^^^^^
We return if is_local is non-zero.

  1784              !(produce_size || consume_size) ||
  1785              !context || context_id = VMCI_INVALID_ID ||
  1786              handle.context = VMCI_INVALID_ID) {
  1787                  return VMCI_ERROR_INVALID_ARGS;
  1788          }
  1789  
  1790          if (page_store && !VMCI_QP_PAGESTORE_IS_WELLFORMED(page_store))
  1791                  return VMCI_ERROR_INVALID_ARGS;
  1792  
  1793          /*
  1794           * In the initial argument check, we ensure that non-vmkernel hosts
  1795           * are not allowed to create local queue pairs.
  1796           */
  1797  
  1798          mutex_lock(&qp_broker_list.mutex);
  1799  
  1800          if (!is_local && vmci_ctx_qp_exists(context, handle)) {
                    ^^^^^^^^^
We already know this is that is_local is zero.

  1801                  pr_devel("Context (ID=0x%x) already attached to queue pair (handle=0x%x:0x%x)\n",
  1802                           context_id, handle.context, handle.resource);
  1803                  mutex_unlock(&qp_broker_list.mutex);
  1804                  return VMCI_ERROR_ALREADY_EXISTS;
  1805          }
  1806  
  1807          if (handle.resource != VMCI_INVALID_ID)
  1808                  entry = qp_broker_handle_to_entry(handle);
  1809  
  1810          if (!entry) {
  1811                  create = true;
  1812                  result   1813                      qp_broker_create(handle, peer, flags, priv_flags,
  1814                                       produce_size, consume_size, page_store,
  1815                                       context, wakeup_cb, client_data, ent);
  1816          } else {
  1817                  create = false;
  1818                  result   1819                      qp_broker_attach(entry, peer, flags, priv_flags,
  1820                                       produce_size, consume_size, page_store,
  1821                                       context, wakeup_cb, client_data, ent);
  1822          }
  1823  
  1824          mutex_unlock(&qp_broker_list.mutex);
  1825  
  1826          if (swap)
  1827                  *swap = (context_id = VMCI_HOST_CONTEXT_ID) &&
  1828                      !(create && is_local);
                                        ^^^^^^^^
Another duplicative check.

  1829  
  1830          return result;
  1831  }


regards,
dan carpenter

