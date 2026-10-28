include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

du_lieu = [10, 5, 8, 1, 9]
println("Input: ", du_lieu)
ket_qua = giai_bai(du_lieu)
println("Output (Heapsort): ", ket_qua)


