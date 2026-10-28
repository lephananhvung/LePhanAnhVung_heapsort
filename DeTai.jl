module DeTai

export kiem_tra_dau_vao, giai_bai, day_xuong!, tao_heap!, heapsort!

function kiem_tra_dau_vao(du_lieu::Vector{Int})
    if length(du_lieu) > 200
        error("Lỗi: Kích thước mảng vượt quá 200 phần tử (tối đa 200).")
    end
    for x in du_lieu
        if x < -1000 || x > 1000
            error("Lỗi: Giá trị $x nằm ngoài miền cho phép [-1000, 1000].")
        end
    end
    return true
end

function kiem_tra_dau_vao(du_lieu)
    error("Lỗi: Dữ liệu vào phải là mảng số nguyên (Vector{Int}).")
end

function day_xuong!(a::Vector{Int}, i::Int, heap_size::Int)
    lon_nhat = i
    trai = 2 * i
    phai = 2 * i + 1

    if trai <= heap_size && a[trai] > a[lon_nhat]
        lon_nhat = trai
    end

    if phai <= heap_size && a[phai] > a[lon_nhat]
        lon_nhat = phai
    end

    if lon_nhat != i
        a[i], a[lon_nhat] = a[lon_nhat], a[i]
        day_xuong!(a, lon_nhat, heap_size)
    end
end

function tao_heap!(a::Vector{Int})
    n = length(a)
    for i in div(n, 2):-1:1
        day_xuong!(a, i, n)
    end
end

function heapsort!(a::Vector{Int})
    if length(a) <= 1
        return a
    end
    
    tao_heap!(a)
    n = length(a)
    for i in n:-1:2
        a[1], a[i] = a[i], a[1]
        day_xuong!(a, 1, i - 1)
    end
    return a
end

function giai_bai(du_lieu::Vector{Int})
    kiem_tra_dau_vao(du_lieu)
    a_copy = copy(du_lieu)
    heapsort!(a_copy)
    return a_copy
end

end # module DeTai