from qiskit import QuantumCircuit, Aer, execute
from qiskit.visualization import plot_histogram

# Создаем квантовую схему с двумя кубитами и двумя классическими битами
qc = QuantumCircuit(2, 2)

# Применяем Hadamard гейт к первому кубиту для создания суперпозиции
qc.h(0)

# Применяем CNOT гейт для запутывания кубитов (контрольный кубит 0, целевой кубит 1)
qc.cx(0, 1)

# Измеряем кубиты и сохраняем результат в классические биты
qc.measure([0, 1], [0, 1])

# Симуляция схемы
simulator = Aer.get_backend('qasm_simulator')
result = execute(qc, backend=simulator, shots=1000).result()

# Получаем результат измерений
counts = result.get_counts()

# Визуализируем результат
print("Результаты измерений:", counts)
plot_histogram(counts)
